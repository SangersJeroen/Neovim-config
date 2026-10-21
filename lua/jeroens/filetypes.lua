-- HTCondor submit files: Neovim has no built-in support and detects `.sub` as KUKA robot language.
vim.filetype.add({
    extension = {
        sub = 'condor',
        submit = 'condor',
        condor = 'condor',
        htc = 'condor',
    },
})
