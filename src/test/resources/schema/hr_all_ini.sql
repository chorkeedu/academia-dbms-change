-- -----------------------------------------------------------------------------
-- file hr_all_ini.sql
-- -----------------------------------------------------------------------------
-- @author    Academia<devs@chorke.org>
-- @version   0.0.00
-- @since     0.0.00
-- -----------------------------------------------------------------------------
-- ddl drop
-- -----------------------------------------------------------------------------
DROP DATABASE IF EXISTS `hr_dev`;
DROP DATABASE IF EXISTS `hr_qac`;
DROP DATABASE IF EXISTS `hr_uat`;
DROP DATABASE IF EXISTS `hr_pro`;

-- -----------------------------------------------------------------------------
-- ddl create
-- -----------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS `hr_dev` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS `hr_qac` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS `hr_uat` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS `hr_pro` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- -----------------------------------------------------------------------------
-- ddl end
-- -----------------------------------------------------------------------------
