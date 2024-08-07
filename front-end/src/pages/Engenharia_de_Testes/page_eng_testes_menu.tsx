import { useState } from 'react';
import { Link } from 'react-router-dom';
// Componentes
import { Sidebar } from '../../components/sidebar';
import { HelloUser } from '../../components/hello_user';
import { MenuButton } from '../../components/button_menu';
import { Logo } from '../../components/logo';

// Icones
import { IoMenu } from "react-icons/io5";
import { FaHome, FaRegListAlt } from "react-icons/fa";
import { IoIosArrowForward } from "react-icons/io";
import { LuUsers2 } from "react-icons/lu";
import { BsWindowDesktop } from "react-icons/bs";
// import { GiCircuitry } from "react-icons/gi";
import { TbDeviceDesktopCog } from "react-icons/tb";
import { FaComputer, FaEarListen } from "react-icons/fa6";
import { CgNotes } from "react-icons/cg";

export function MenuEngTestes() {
    const [showSidebar, setShowSidebar] = useState(false);

    return (
        <div className='w-screen h-screen flex flex-col'>
            <div className="grid grid-rows-1 bg-cinza-200">
                <div className='inline-flex p-4 gap-4'>
                    <button
                        onClick={() => setShowSidebar(true)}
                        className='text-pec text-4xl hover:scale-110 transition duration-200 flex justify-start items-start'>
                        <IoMenu />
                    </button>
                    <Logo />
                    <div className='flex-col-1 ml-8 mt-4'>
                        <div className='inline-flex content font-bold text-pec gap-2 justify-center items-center'>
                            <Link to={"/menu"} className='inline-flex items-center gap-2'>
                                <FaHome className='mobile:w-0' />
                                <p className='mobile:text-[0px]'>Menu</p>
                            </Link>
                            <IoIosArrowForward className='mobile:w-0' />
                            <p className='mobile:text-sm mobile:absolute mobile:right-0 mobile:mr-4 mobile:w-24 mobile:text-center mobile:mb-5'>Engenharia de Testes</p>
                        </div>
                        <HelloUser />
                    </div>
                </div>
            </div>
            <div className='bg-cinza-200 w-screen h-5/6 px-4'>
                <div className="bg-cinza-100 rounded-md drop-shadow grid mobile:grid-cols-2 sm:grid-cols-5 grid-cols-6 justify-items-center p-10 gap-10">
                    <MenuButton name={"Abrir chamado"} link={"/engenharia_testes/abrir_chamado"} icon={LuUsers2} />
                    <MenuButton name={"Visualizar chamados"} link={"/engenharia_testes/visualizar_chamados"} icon={FaRegListAlt} />
                    {localStorage.getItem('user') === 'samuel.grontoski' || localStorage.getItem('user') === 'marcos.souza' || localStorage.getItem('user') === 'leandro.ferreira' ?
                        <MenuButton name={"Gestão Visual de chamados"} link={"/engenharia_testes/gestao_visual_chamados"} icon={BsWindowDesktop} /> : ''
                    }
                    <MenuButton name={"Atendimento de chamado"} link={"/engenharia_testes/chamados"} icon={FaEarListen} />
                    <MenuButton name={"Consultar Computadores"} link={"/engenharia_testes/consultar_computadores"} icon={FaComputer} />
                    <MenuButton name={"Consultar Dispositivos"} link={"/engenharia_testes/consultar_dispositivos"} icon={TbDeviceDesktopCog} />
                    {/*
                    <MenuButton name={"Gerenciamento de Insumos"} link={"/engenharia_testes/gerenciamento_insumos"} icon={GiCircuitry} />
                    <MenuButton name={"Chamado de Engenharia"} link={"/engenharia_testes/chamados_engenharia"} icon={PiCircuitry} />
                    <MenuButton name={"Relatório de chamados"} link={"/engenharia_testes/relatorio_chamados"} icon={BsGraphUpArrow} />
                    <MenuButton name={"Enviar Plano de Produção"} link={"/engenharia_testes/enviar_plano_de_producao"} icon={TbTableImport} />
                    <MenuButton name={"Pesquisa de Indicadores"} link={"/engenharia_testes/pesquisa_de_indicadores"} icon={MdOutlineContentPasteSearch} />
                    <MenuButton name={"Vincular Equipamentos e Produtos"} link={"/engenharia_testes/vincular_equipamento_produto"} icon={BiLink} />
                    <MenuButton name={"Listar Produtos"} link={"/engenharia_testes/listar_produtos"} icon={AiOutlineUnorderedList} />
                    <MenuButton name={"Receber Equipamento"} link={"/engenharia_testes/receber_equipamento"} icon={BsBoxArrowInRight} />
                    <MenuButton name={"Devolver Equipamento"} link={"/engenharia_testes/devolver_equipamento"} icon={BsBoxArrowRight} />
                    <MenuButton name={"Manutenção Preventiva"} link={"/engenharia_testes/manutencao_preventiva"} icon={GrHostMaintenance} />
                    <MenuButton name={"Formulários de Manutenção"} link={"/engenharia_testes/formularios_de_manutencao"} icon={FaWpforms} />
                    */}
                    <MenuButton name={"Listar Notas Fiscais"} link={"/engenharia_testes/listar_notas_fiscais"} icon={CgNotes} />
                </div>
            </div>

            {showSidebar && (
                <div className='backdrop-blur-xs fixed inset-y-0 w-screen z-50'>
                    <Sidebar />
                    <button
                        onClick={() => setShowSidebar(false)}
                        className='absolute top-6 left-6 text-cinza-200 text-4xl hover:scale-110 transition duration-200'
                    >
                        <IoMenu />
                    </button>
                </div>
            )}
        </div>
    )
}