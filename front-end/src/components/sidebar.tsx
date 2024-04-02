import logo from "../assets/icon_pec_cinza.svg"

export const Sidebar = (props) => {
    return (
<<<<<<< HEAD
        <div>
            <header className="grid justify-items-center items-center fixed top-10 left-14 text-cinza-200 font-semibold">
=======
        <div className="bg-pec absolute inset-y-0 left-0 w-[200px]">
            <header className="grid justify-items-center items-center absolute top-10 left-14 text-cinza-200 font-semibold">
>>>>>>> 769c76b2e8f0543495a99bd2882f0065bb94177c
                <div className="flex items-center gap-2 top-10">
                  <img src={logo} alt="PEC" />
                  <h1 className='text-xl'>PEC</h1>
                </div>
                  <p className='flex flex-col items-center gap-2 text-sm'>ProEngControl</p>
              </header>
              <main>
                <footer>
<<<<<<< HEAD
                    <p className="fixed bottom-2 left-2 text-cinza-200 font-semibold text-[10px]">
=======
                    <p className="absolute bottom-2 left-2 text-cinza-200 font-semibold text-[10px]">
>>>>>>> 769c76b2e8f0543495a99bd2882f0065bb94177c
                        Desenvolvido por <br></br> Marcos Souza & Samuel Grontoski
                    </p>
                </footer>
              </main>
              {props.children}
        </div>
    )
}