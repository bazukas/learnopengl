#ifndef MODEL_H
#define MODEL_H
#include <string>
#include <vector>
#include <assimp/scene.h>

#include "shader.h"
#include "mesh.hpp"


class Model
{
    public:
        Model(std::string path, bool gamma = false) : gammaCorrection(gamma)
        {
            loadModel(path);
        }
        void Draw(Shader &shader);
    private:
        std::vector<Mesh> meshes;
        std::vector<Texture> textures_loaded;
        std::string directory;
        bool gammaCorrection;

        void loadModel(std::string path);
        void processNode(aiNode *node, const aiScene *scene);
        Mesh processMesh(aiMesh *mesh, const aiScene *scene);
        std::vector<Texture> loadMaterialTextures(aiMaterial *mat, aiTextureType type, std::string typeName);
        unsigned int textureFromFile(const char *path);
};

#endif
