import React from "react";
import { Link } from 'react-router-dom';
import { Sidebar } from '../components/sidebar';
import { BarraPesquisa } from '../components/barra_pesquisa';
import { useEffect, useState } from 'react';
<<<<<<< HEAD
import { CollapsibleTable } from "../components/collapsible_table"

=======
import { MainView } from '../components/main_view';
import Table from "../components/table";
>>>>>>> 769c76b2e8f0543495a99bd2882f0065bb94177c

export function Chamados() {
    const [dados, setDados] = useState([]);

<<<<<<< HEAD
=======

>>>>>>> 769c76b2e8f0543495a99bd2882f0065bb94177c
    useEffect(() => {
        const intervalId = setInterval(fetchData, 3000); // Busca os dados a cada 1 minuto
        return () => clearInterval(intervalId); // Limpa o temporizador quando o componente é desmontado
    }, []);

    // useEffect(function () {
    //     const socket = io('http://127.0.0.1:5000'); // Conectar ao servidor de WebSocket do backend


    //     // Manipular eventos de atualização de dados
    //     socket.on('dadosAtualizados', () => {
    //         fetchData(); // Buscar dados quando os dados forem atualizados no backend
    //     });
    //     return () => socket.disconnect(); // Desconectar quando o componente for desmontado
    // }, []);

    const fetchData = async () => {
        try {
            const response = await fetch('http://127.0.0.1:5000/api/dadoschamados');
            if (response.ok) {
                const data = await response.json();
                setDados(data);
            } else {
                console.error('Erro ao buscar dados: ', response.statusText);
            }
        } catch (error) {
            console.error("Erro fetching dados: ", error)
        }
    };
<<<<<<< HEAD

    return (
        <div className="bg-cinza-200 w-full h-full">
            <body>
                <div className="bg-pec fixed inset-y-0 left-0 w-[200px]">
                    <Sidebar />
                </div>
=======
    return (
        <div>
            <Background />
            <body>
                <Sidebar />
>>>>>>> 769c76b2e8f0543495a99bd2882f0065bb94177c
                <main className='absolute inset-y-0 right-0 w-10/12 grid gap-y-5 p-10'>
                    <BarraPesquisa />
                    <div className='w-9/12 text-cinza-500'>
                        <p className='text-sm'>Dashboard Chamados</p>
                        <p className='text-base'>Olá, @usuário</p>
                    </div>
<<<<<<< HEAD
                    <div>
                        <div className="py-5">
                            <CollapsibleTable />
                        </div>
                        {/* <div className='grid justify-items-center p-5'>
=======
                    <MainView className='flex justify-items-center'>
                        <div>
                        </div>
                        <div className='grid justify-items-center p-5'>
>>>>>>> 769c76b2e8f0543495a99bd2882f0065bb94177c
                            <table className="table-fixed table-xs w-11/12 md:w-full border-collapse text-xs">
                                <thead>
                                    <tr className='bg-table_header'>
                                        <th className='p-2 border border-slate-600'>Tipo</th>
                                        <th className='p-2 border border-slate-600'>Status</th>
                                        <th className='p-2 border border-slate-600'>Duração Total</th>
                                        <th className='p-2 border border-slate-600'>Tempo de Atendimento</th>
                                        <th className='p-2 border border-slate-600'>Tipo de Chamado</th>
                                        <th className='p-2 border border-slate-600'>Local</th>
                                        <th className='p-2 border border-slate-600'>Produto</th>
                                        <th className='p-2 border border-slate-600'>Cliente</th>
                                        <th className='p-2 border border-slate-600'>Responsável</th>
                                        <th className='p-2 border border-slate-600'>Descrição do chamado</th>
                                        <th className='p-2 border border-slate-600'>Operador</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {dados.map(chamado => (
                                        <tr className='bg-white' key={chamado.cha_id}>
                                            <td className='border border-slate-600'>{chamado.cha_tipo}</td>
                                            <td className='border border-slate-600'>{chamado.cha_status}</td>
                                            <td className='border border-slate-600'>{chamado.cha_data_hora_abertura}</td>
                                            <td className='border border-slate-600'>{chamado.cha_data_hora_atendimento}</td>
                                            <td className='border border-slate-600'>{chamado.cha_tipo}</td>
                                            <td className='border border-slate-600'>{chamado.cha_DT}</td>
                                            <td className='border border-slate-600'>{chamado.cha_produto}</td>
                                            <td className='border border-slate-600'>{chamado.cha_cliente}</td>
                                            <td className='border border-slate-600'>{chamado.cha_acao}</td>
                                            <td className='border border-slate-600'>{chamado.cha_descricao}</td>
                                            <td className='border border-slate-600'>{chamado.cha_operador}</td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
<<<<<<< HEAD
                        </div> */}
                    </div>
=======
                        </div>
                    </MainView>
>>>>>>> 769c76b2e8f0543495a99bd2882f0065bb94177c
                </main>
            </body>

        </div>
    )
}