#include "ROOT/RDataFrame.hxx"

using namespace ROOT; // RDataFrame's namespace

bool batch = true;

//method to convert the text file to vector of ROOT files 
std::vector<std::string>
TxtFileListToVecStr(const std::string f)
{
    std::ifstream infile(f, std::ifstream::in);

    int i = 0;

    std::vector<std::string> v;
    std::string line("");

    while (std::getline(infile, line))
    {

        if (i > 0)
        {
            break;
        }
        i++;

        line.erase(std::remove(line.begin(), line.end(), '\n'), line.end());
        line.erase(std::remove(line.begin(), line.end(), '\r'), line.end());
        line.erase(std::remove(line.begin(), line.end(), '\t'), line.end());
        if (line.find_first_not_of(' ') == std::string::npos)
            continue;
        if (line[line.find_first_not_of(' ')] == '#')
            continue;

        if (batch)
        {
            v.push_back("root://cms-xrd-global.cern.ch//" + line);
        }
        else
        {
            v.push_back("root://" + line);
        }
        
    }

    infile.close();
    return v;
}



//main function
void BasicScript(){

	std::string inputFile = "/afs/cern.ch/work/c/coldham/private/HTCondor/tZq_signal_files.txt";

	std::vector<std::string> file_locations = TxtFileListToVecStr(inputFile);
	
	std::cout << "file_locations.size() = " << file_locations.size() << std::endl;
	std::cout << "file_locations.at(0) = " << file_locations.at(0) << std::endl;

	ROOT::RDataFrame d("Events", file_locations);

	auto d_ElectronFilter = d.Filter("nElectron == 2", "Events with exactly two electrons");
	
	auto output = d_ElectronFilter.Snapshot("Events", "output.root", {"nElectron"});


}
