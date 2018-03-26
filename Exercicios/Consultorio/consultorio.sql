-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 26-Mar-2018 às 19:55
-- Versão do servidor: 5.7.17
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `consultorio`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agendamento`
--

CREATE TABLE `agendamento` (
  `cdAgendamento` int(10) NOT NULL,
  `cdPaciente` int(10) NOT NULL,
  `cdEspecialidade` int(10) NOT NULL,
  `cdMedico` int(10) NOT NULL,
  `cdFuncionario` int(10) NOT NULL,
  `nrDia` date NOT NULL,
  `nrHora` time(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `diagnostico`
--

CREATE TABLE `diagnostico` (
  `cdDiagnostico` int(10) NOT NULL,
  `cdAgendamento` int(10) NOT NULL,
  `dsObservacao` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `especialidade`
--

CREATE TABLE `especialidade` (
  `cdEspecialidade` int(10) NOT NULL,
  `dsEspecialidade` text NOT NULL,
  `flATIVO` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `exames`
--

CREATE TABLE `exames` (
  `cdExames` int(10) NOT NULL,
  `dsTipo` varchar(32) NOT NULL,
  `cdfuncionario` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `cdFuncionario` int(10) NOT NULL,
  `nmFuncionario` text NOT NULL,
  `dtNasc` date NOT NULL,
  `dsEndereco` text NOT NULL,
  `nrTelefone` varchar(32) NOT NULL,
  `dsEmail` text NOT NULL,
  `CPF` varchar(32) NOT NULL,
  `RG` varchar(32) NOT NULL,
  `dsCargo` text NOT NULL,
  `vlSalario` decimal(16,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `medico`
--

CREATE TABLE `medico` (
  `CdMedico` int(10) NOT NULL,
  `dsCRM` varchar(32) NOT NULL,
  `nmMedico` int(150) NOT NULL,
  `nrTelefone` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `medicohora`
--

CREATE TABLE `medicohora` (
  `CdMedico` int(10) NOT NULL,
  `nrDiaEntrada` date NOT NULL,
  `nrHorario` time(6) NOT NULL,
  `nrHorarioFim` time(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `medico_especialidade`
--

CREATE TABLE `medico_especialidade` (
  `CdMedico` int(10) NOT NULL,
  `cdEspecialiade` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `paciente`
--

CREATE TABLE `paciente` (
  `cdPaciente` int(10) NOT NULL,
  `nmPaciente` text NOT NULL,
  `dtNasc` date NOT NULL,
  `dsEndereco` text NOT NULL,
  `nrTelefone` varchar(32) NOT NULL,
  `dsEmail` varchar(32) NOT NULL,
  `CPF` varchar(32) NOT NULL,
  `RG` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `prontuario`
--

CREATE TABLE `prontuario` (
  `cdProntuario` int(10) NOT NULL,
  `cdAgendamento` int(10) NOT NULL,
  `cdResultado` int(10) NOT NULL,
  `cdDiagnostico` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `resultado_exames`
--

CREATE TABLE `resultado_exames` (
  `cdRExames` int(10) NOT NULL,
  `cdExames` int(10) NOT NULL,
  `cdAgendamento` int(10) NOT NULL,
  `dsResultado` text NOT NULL,
  `nrDia` date NOT NULL,
  `nrHora` time(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agendamento`
--
ALTER TABLE `agendamento`
  ADD PRIMARY KEY (`cdAgendamento`);

--
-- Indexes for table `especialidade`
--
ALTER TABLE `especialidade`
  ADD PRIMARY KEY (`cdEspecialidade`);

--
-- Indexes for table `exames`
--
ALTER TABLE `exames`
  ADD PRIMARY KEY (`cdExames`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`cdFuncionario`);

--
-- Indexes for table `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`CdMedico`);

--
-- Indexes for table `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`cdPaciente`);

--
-- Indexes for table `prontuario`
--
ALTER TABLE `prontuario`
  ADD PRIMARY KEY (`cdProntuario`);

--
-- Indexes for table `resultado_exames`
--
ALTER TABLE `resultado_exames`
  ADD PRIMARY KEY (`cdRExames`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
