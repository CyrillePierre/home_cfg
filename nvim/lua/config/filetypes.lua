vim.filetype.add{
  extension = {
    launch = 'xml',
    world  = 'xml',
    sdf    = 'xml',
    urdf   = 'xml',
    rd     = 'rd',
    shader = 'glsl',
    frag   = 'glsl',
    vert   = 'glsl',
    tex    = 'tex',
  },
  filename = {
    ['compose.yaml']        = 'yaml.docker-compose',
    ['compose.yml']         = 'yaml.docker-compose',
    ['docker-compose.yaml'] = 'yaml.docker-compose',
    ['docker-compose.yml']  = 'yaml.docker-compose',
    changelog               = 'changelog',
    ChangeLog               = 'changelog',
    CHANGELOG               = 'changelog',
  },
}
