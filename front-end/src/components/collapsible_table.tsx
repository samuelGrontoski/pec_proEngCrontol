import React, { useEffect, useState } from 'react';
import Box from '@mui/material/Box';
import Collapse from '@mui/material/Collapse';
import IconButton from '@mui/material/IconButton';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import TablePagination from '@mui/material/TablePagination';
import Paper from '@mui/material/Paper';
import KeyboardArrowDownIcon from '@mui/icons-material/KeyboardArrowDown';
import KeyboardArrowUpIcon from '@mui/icons-material/KeyboardArrowUp';
import Draggable from 'react-draggable';
import { useMediaQuery } from 'react-responsive';
import { Modal, Button } from 'react-bootstrap';
import { IoMdClose } from "react-icons/io";
import 'react-toastify/dist/ReactToastify.css';

function Row(props: any) {
  const { row } = props;
  const [open, setOpen] = React.useState(false);
  const [showModal, setShowModal] = useState(false);
  const [showModalDesistir, setShowModalDesistir] = useState(false);
  const [tempoInicioAtendimento, setTempoInicioAtendimento] = React.useState<Date | null>(null);

  const isMobile = useMediaQuery({
    query: '(max-width: 639px)'
  });

  const calculateDuration = (start: string) => {
    const startDate = new Date(start);
    const currentDate = new Date();
    let duration = currentDate.getTime() - startDate.getTime();

    let isNegative = false;
    if (duration < 0) {
      isNegative = true;
      duration *= -1;
    }

    const hours = Math.floor(duration / (1000 * 60 * 60)).toString().padStart(2, '0');
    const minutes = Math.floor((duration % (1000 * 60 * 60)) / (1000 * 60)).toString().padStart(2, '0');
    const seconds = Math.floor((duration % (1000 * 60)) / 1000).toString().padStart(2, '0');

    let formattedDuration = `${hours}:${minutes}:${seconds}`;

    if (isNegative) {
      formattedDuration = `-${formattedDuration}`;
    }

    return formattedDuration;
  };

  const calculateDurationAtendimento = (start: string) => {
    if (!start) {
      return '00:00:00'
    }

    const startDate = new Date(start);
    const currentDate = new Date();
    const duration = currentDate.getTime() - startDate.getTime();

    const hours = Math.floor(duration / (1000 * 60 * 60)).toString().padStart(2, '0');
    const minutes = Math.floor((duration % (1000 * 60 * 60)) / (1000 * 60)).toString().padStart(2, '0');
    const seconds = Math.floor((duration % (1000 * 60)) / 1000).toString().padStart(2, '0');

    return `${hours}:${minutes}:${seconds}`;
  };

  useEffect(() => {
    if (row.cha_status === 2 && !tempoInicioAtendimento) {
      setTempoInicioAtendimento(new Date());
    }
  }, [row.cha_status]);



  return (
    <React.Fragment>
      <TableRow>
        <TableCell className='border-2 border-gray-300 w-10'>
          <div className={`rounded-3xl 
              ${row.cha_plano === 1 ? 'bg-no_plano text-gray-100' :
              row.cha_plano === 0 ? 'bg-fora_plano text-black' : 'bg-engenharia text-gray-100'}`}>
            <IconButton
              aria-label="expand row"
              size="small"
              onClick={() => setOpen(!open)}
              className='mobile:w-4 text-black'
            >
              {open ? <KeyboardArrowUpIcon /> : <KeyboardArrowDownIcon />}
            </IconButton>
          </div>
        </TableCell>
        <TableCell align="center" className="border-2 border-gray-300 w-[100px]">
          <p className={`mobile:text-xs flex justify-center items-center rounded p-2 font-semibold mobile:w-17 w-[80px] 
              ${row.cha_plano === 1 ? 'bg-no_plano text-gray-100' : (row.cha_plano === 0) ? 'bg-fora_plano text-black' : 'bg-engenharia text-gray-100'
            }`}
          >
            {calculateDuration(row.cha_data_hora_abertura)}
          </p>
        </TableCell>
        <TableCell align='center' className="border-2 border-gray-300 w-[140px]"><p className='mobile:hidden font-semibold'>{row.cha_status === 2 ? calculateDurationAtendimento(row.cha_data_hora_atendimento) : "00:00:00"}</p></TableCell>
        <TableCell align="center" className="border-2 border-gray-300 w-40">
          <>
            {row.cha_status === 1 ? (
              <button
                onClick={() => setShowModal(true)}
                type="button"
                className='mobile:text-xs mobile:w-24 w-40 rounded shadow text-white bg-no_plano hover:bg-red-800 p-2'
              >
                Atender chamado
              </button>
            ) : (
              <button
                onClick={() => setShowModal(true)}
                type="button"
                className='mobile:text-xs mobile:w-24 w-40 rounded shadow text-white bg-pec p-2'
              >
                Em atendimento
              </button>
            )}
          </>
        </TableCell>
        <TableCell align="center" className="border-2 border-gray-300 w-[200px]"><p className='mobile:text-xs mobile:w-20'>{row.tipo_chamado}</p></TableCell>
        <TableCell align="center" className="border-2 border-gray-300 w-[200px] mobile:hidden"><p className='mobile:hidden'>{row.produto_nome}</p></TableCell>
        <TableCell className='border-2 border-gray-300'><p className='mobile:hidden'>{row.cliente_nome}</p></TableCell>
        <TableCell align="center" className="border-2 border-gray-300 w-[140px]"><p className='mobile:text-xs'>{row.cha_local}</p></TableCell>
      </TableRow>
      <TableRow>
        <TableCell style={{ paddingBottom: 0, paddingTop: 0, backgroundColor: '#d9d9d9' }} colSpan={8}>
          <Collapse in={open} timeout="auto" unmountOnExit>
            <Box sx={{ margin: 1 }}>
              <p className='text-lg text-pec font-bold'>Detalhes</p>
              <Table size="small" aria-label="purchases">
                <TableHead>
                  <TableRow>
                    <div className='grid'>
                      <div className='mobile:text-xs inline-flex gap-2'>
                        <p className='font-bold text-pec'>{row.cha_status === 2 ? "Responsável:" : ""}</p><p>{row.responsavel}</p>
                      </div>
                      <div className='inline-flex gap-2'>
                        <p className='mobile:text-xs text-[0px] font-bold'>{row.cha_status === 2 ? "Tempo de Atendimento: " : ""}</p><p className='mobile:text-xs text-[0px]'>{row.cha_status === 2 ? calculateDurationAtendimento(row.cha_data_hora_atendimento) : ""}</p>
                      </div>
                      <div className='inline-flex gap-2'>
                        <p className='mobile:text-xs text-[0px] font-bold text-pec'>Produto:</p><p className='mobile:text-xs text-[0px]'>{row.produto_nome}</p>
                      </div>
                      <div className='inline-flex gap-2'>
                        <p className='mobile:text-xs text-[0px] font-bold text-pec'>Cliente:</p><p className='mobile:text-xs text-[0px]'>{row.cliente_nome}</p>
                      </div>
                      <div className='mobile:text-xs inline-flex gap-2'>
                        <p className='font-bold text-pec'>Descrição:</p><p className='mobile:w-[240px]'>{row.cha_descricao}</p>
                      </div>
                      <div className='mobile:text-xs inline-flex gap-2'>
                        <p className='font-bold text-pec'>Operador:</p><p>{row.cha_operador}</p>
                      </div>
                    </div>
                  </TableRow>
                </TableHead>
              </Table>
            </Box>
          </Collapse>
        </TableCell>
      </TableRow>
      {showModal ? (
        <>
          <Draggable disabled={isMobile}>
            <div className={`mobile:fixed mobile:inset-0 mobile:overflow-hidden mobile:w-screen w-[80vw] max-w-[800px] rounded-lg shadow bg-cinza-300 border-5 mobile:border-none absolute top-20 left-40 z-50 p-3 ${row.cha_plano === 1 ? 'border-no_plano' : row.cha_plano === 0 ? 'border-fora_plano text-black' : 'border-engenharia'}`}>
              <header className="rounded-lg mobile:cursor-auto cursor-move text-base flex flex-col gap-2">
                <nav className='flex justify-between items-center'>
                  <span className="text-2xl font-semibold">Atendendo chamado</span>
                  <button
                    onClick={() => setShowModalDesistir(true)}
                    type="button"
                    className="text-cinza-100 bg-no_plano rounded font-bold uppercase mobile:p-0 px-6 py-2 mobile:text-xs text-sm"
                  >
                    Desistir do chamado
                  </button>
                  {showModalDesistir ? (
                    <Modal show={showModalDesistir}>
                      <Modal.Header className='flex justify-between'>
                        <Modal.Title>Desistir do Chamado</Modal.Title>
                        <button type="button" aria-label="Close" onClick={() => setShowModalDesistir(false)}><IoMdClose /></button>
                      </Modal.Header>
                      <Modal.Body>Tem certeza que deseja desistir do atendimento do chamado?</Modal.Body>
                      <Modal.Footer>
                        <Button
                          className='bg-pec border-none'
                          variant="secondary"
                          onClick={() => setShowModalDesistir(false)}
                        >
                          Cancelar
                        </Button>
                        <Button
                          className='bg-no_plano border-none'
                          variant="primary"
                          onClick={() => { setShowModalDesistir(false), setShowModal(false) }}
                        >
                          Desistir
                        </Button>
                      </Modal.Footer>
                    </Modal>
                  ) : null}
                </nav>
                <div className='flex items-start justify-start gap-2'>
                  <p className="font-semibold">Produto:</p><p>{row.produto_nome}</p>
                </div>
                <div className='flex items-start justify-start gap-2'>
                  <p className="font-semibold">Cliente:</p><p>{row.cliente_nome}</p>
                </div>
                <div className='flex items-start justify-start gap-2'>
                  <p className="font-semibold">Local:</p><p>{row.cha_local}</p>
                </div>
                <div className='flex items-start justify-start gap-2'>
                  <p className="font-semibold">Tipo de chamado:</p><p>{row.tipo_chamado}</p>
                </div>
                <p className="font-semibold">Problema:</p>
                <p>{row.cha_descricao}</p>
                <p className={`flex justify-center items-center rounded p-2 text-gray-100 mobile:text-5xl text-8xl ${row.cha_plano === 1 ? 'bg-no_plano' : row.cha_plano === 0 ? 'bg-fora_plano text-black' : 'bg-engenharia'
                  }`} style={{ textShadow: '2px 2px 2px black' }}>{calculateDurationAtendimento(row.cha_data_hora_atendimento)}</p>
              </header>
              <body className='bg-cinza-300'>
                <main>
                  <form>
                    <label className="block text-black text-sm font-bold mt-4 mb-1">
                      Descrição da solução:
                    </label>
                    <textarea className="bg-gray-100 shadow appearance-none border rounded w-full h-20 py-2 px-1 text-black resize-none"></textarea>
                  </form>
                </main>
                <footer className="flex items-center justify-between gap-2 mt-4">
                  <button
                    onClick={() => ''}
                    type="button"
                    className="text-pec bg-cinza-400 rounded font-bold uppercase p-3 mobile:text-xs text-sm outline-none focus:outline-none mr-1 mb-1"
                  >
                    Tranferir chamado
                  </button>
                  <button
                    onClick={() => ''}
                    type="button"
                    className="text-pec bg-cinza-400 rounded font-bold uppercase p-3 mobile:text-xs text-sm outline-none focus:outline-none mr-1 mb-1"
                  >
                    Adicionar ajudante
                  </button>
                  <button
                    onClick={() => setShowModal(false)}
                    type="button"
                    className="text-cinza-100 bg-pec font-bold uppercase mobile:text-xs text-sm p-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1"
                  >
                    Encerrar chamado
                  </button>
                </footer>
              </body>
            </div>
          </Draggable>
        </>
      ) : null}
    </React.Fragment>
  );
}

export function CollapsibleTable() {

  const [page, setPage] = React.useState(0);
  const [rowsPerPage, setRowsPerPage] = React.useState(10);
  const [dados, setDados] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch('http://localhost:5000/api/chamados');
        if (response.ok) {
          const data = await response.json();
          const sortedData = data.sort((a: any) => {
            if (a.cha_plano === 1) return -1;
            if (a.cha_plano === 0) return -1;
            return 1;
          });
          setDados(sortedData);
        } else {
          console.error('Erro ao buscar dados: ', response.statusText);
        }
      } catch (error) {
        console.error("Erro fetching dados: ", error)
      }
    };
    fetchData();

    const intervalId = setInterval(fetchData, 1000);
    return () => clearInterval(intervalId);
  }, []);

  const handleChangePage = (event: any, newPage: any) => {
    setPage(newPage);
    const aux = (event.target.value)
    console.log(aux)
  };

  const handleChangeRowsPerPage = (event: any) => {
    setRowsPerPage(parseInt(event.target.value, 10));
    setPage(0);
  };

  return (
    <div className="h-full bg-cinza-200 px-4">
      <TableContainer component={Paper}>
        <Table aria-label="collapsible table">
          <TableHead sx={{ backgroundColor: '#d9d9d9' }}>
            <TableRow>
              <TableCell />
              <TableCell>
                <p className='font-bold mobile:text-xs text-base mobile:w-17 w-[80px] text-center text-pec'>Duração Total</p>
              </TableCell>
              <TableCell>
                <p className='font-bold mobile:hidden text-base text-center text-pec'>Tempo de Atendimento</p>
              </TableCell>
              <TableCell>
                <p className='font-bold mobile:text-xs text-base mobile:w-10 w-[200px] text-center text-pec'>Status</p>
              </TableCell>
              <TableCell>
                <p className='font-bold mobile:text-xs text-base mobile:w-10 w-[200px] text-center text-pec'>Tipo de Chamado</p>
              </TableCell>
              <TableCell>
                <p className='font-bold mobile:hidden text-base w-[180px] text-center text-pec'>Produto</p>
              </TableCell>
              <TableCell>
                <p className='font-bold mobile:hidden text-base text-start text-pec'>Cliente</p>
              </TableCell>
              <TableCell>
                <p className='font-bold mobile:text-xs text-base w-[100px] text-center text-pec'>Local</p>
              </TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {dados
              .slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage)
              .map((row: any) => (
                <Row key={row.cha_id} row={row} />
              ))}
          </TableBody>
        </Table>
      </TableContainer>
      <TablePagination
        rowsPerPageOptions={[5, 10, 20]}
        component="div"
        count={dados.length}
        rowsPerPage={rowsPerPage}
        page={page}
        onPageChange={handleChangePage}
        onRowsPerPageChange={handleChangeRowsPerPage}
        labelRowsPerPage="Linhas por página"
        labelDisplayedRows={({ from, to, count }) => `${from}-${to} de ${count}`}
      />
    </div >
  );
}