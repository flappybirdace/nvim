require('overseer').register_template(
  {
    -- REQUIRED

    name = "Maven Compile",

    builder = function(params)
      return {
        name = "Compile",
        cmd = { 'mvn' },
        args = { "compile" },
        --      cwd = "/tmp",
        env = {
          --        VAR = "FOO",
        },
        --      components = {"my_custom_component", "default"},
        metadata = {
          --        foo = "bar",
        },
      }
    end,




    -- OPTIONAL


    -- desc = "Optional description of task",


    -- tags = { overseer.TAG.BUILD }, -- Tags can be used in overseer.run_template()


    params = {

      -- See :help overseer-params
    },


    priority = 50, -- Lower comes first.


    -- Add requirements for this template. If they are not met, the template will not be visible.
    -- All fields are optional.
    condition = {
      -- A string or list of strings
      -- Only matches when current buffer is one of the listed filetypes
      --  filetype = {"c", "cpp"},
      -- A string or list of strings
      -- Only matches when cwd is inside one of the listed dirs
      -- dir = "/home/user/my_project",
      -- Arbitrary logic for determining if task is available
      -- callback = function(search)
      --   print(vim.inspect(search))
      --   return true
      -- end,
    },

  })

require('overseer').register_template(
  {
    -- REQUIRED

    name = "Maven Run",

    builder = function(params)
      return {
        name = "Compile",
        cmd = { 'mvn' },
        args = { "exec:java" },
        --      cwd = "/tmp",
        env = {
          --        VAR = "FOO",
        },
        --      components = {"my_custom_component", "default"},
        metadata = {
          --        foo = "bar",
        },
      }
    end,




    -- OPTIONAL


    -- desc = "Optional description of task",


    -- tags = { overseer.TAG.BUILD }, -- Tags can be used in overseer.run_template()


    params = {

      -- See :help overseer-params
    },


    priority = 50, -- Lower comes first.


    -- Add requirements for this template. If they are not met, the template will not be visible.
    -- All fields are optional.
    condition = {
      -- A string or list of strings
      -- Only matches when current buffer is one of the listed filetypes
      --  filetype = {"c", "cpp"},
      -- A string or list of strings
      -- Only matches when cwd is inside one of the listed dirs
      -- dir = "/home/user/my_project",
      -- Arbitrary logic for determining if task is available
      -- callback = function(search)
      --   print(vim.inspect(search))
      --   return true
      -- end,
    },
  })

 
