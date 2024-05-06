// Componentes
import { Sidebar } from '../../components/sidebar';
import { BarraPesquisa } from '../../components/barra_pesquisa';
import { HelloUser } from '../../components/hello_user';
import { CollapsibleTable } from "../../components/collapsible_table"

export function Chamados() {
    return (
        <>
            <div className="bg-cinza-200 fixed inset-y-0 w-screen" />
            <div className="bg-pec fixed inset-y-0 left-0 w-[200px]">
                <Sidebar />
            </div>
            <main className='absolute inset-y-0 right-0 w-10/12 grid content-start gap-y-5 p-10'>
                <BarraPesquisa />
                <HelloUser pagina={"Atendimento de chamados"} user={localStorage.getItem("user")} />
                <div className="py-5">
                    <CollapsibleTable />
                </div>
            </main>
        </>
    )
}