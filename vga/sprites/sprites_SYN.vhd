
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of sprites is

  component INVD4BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component DFD0BWP7T
    port(CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  component AO221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; Z : out std_logic);
  end component;

  component AOI211XD0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component AOI221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; ZN : out std_logic);
  end component;

  component INR2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component OA31D1BWP7T
    port(A1, A2, A3, B : in std_logic; Z : out std_logic);
  end component;

  component OAI211D1BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component OA211D0BWP7T
    port(A1, A2, B, C : in std_logic; Z : out std_logic);
  end component;

  component OAI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component IND3D1BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component ND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component ND4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component NR2XD0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component OA221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; Z : out std_logic);
  end component;

  component AOI222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; ZN : out std_logic);
  end component;

  component OAI211D0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component OAI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component MAOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI211D1BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component AOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OA21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component IND2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component AOI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component NR2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component NR2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component ND3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component ND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component CKND1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component OAI32D0BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component IAO21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component MAOI222D1BWP7T
    port(A, B, C : in std_logic; ZN : out std_logic);
  end component;

  component MOAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AO21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component AOI211D0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component INVD1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component FA1D0BWP7T
    port(A, B, CI : in std_logic; CO, S : out std_logic);
  end component;

  component IOA21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component AN2D0BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component AN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component CKAN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component INR2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component XNR2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component MAOI22D1BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component NR4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component MAOI222D0BWP7T
    port(A, B, C : in std_logic; ZN : out std_logic);
  end component;

  component IND4D0BWP7T
    port(A1, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component AO222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; Z : out std_logic);
  end component;

  component AOI33D0BWP7T
    port(A1, A2, A3, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component AN4D1BWP7T
    port(A1, A2, A3, A4 : in std_logic; Z : out std_logic);
  end component;

  component AO211D0BWP7T
    port(A1, A2, B, C : in std_logic; Z : out std_logic);
  end component;

  component AO22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component NR3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component HA1D0BWP7T
    port(A, B : in std_logic; CO, S : out std_logic);
  end component;

  component IND2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component AN3D0BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component IOA21D1BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component INR2XD0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component CKND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  signal UNCONNECTED, UNCONNECTED0, UNCONNECTED1, n_0, n_1 : std_logic;
  signal n_2, n_3, n_4, n_5, n_6 : std_logic;
  signal n_7, n_8, n_9, n_10, n_11 : std_logic;
  signal n_12, n_13, n_14, n_15, n_16 : std_logic;
  signal n_17, n_18, n_19, n_20, n_21 : std_logic;
  signal n_22, n_23, n_24, n_25, n_26 : std_logic;
  signal n_27, n_28, n_29, n_30, n_31 : std_logic;
  signal n_32, n_33, n_34, n_35, n_36 : std_logic;
  signal n_37, n_38, n_39, n_40, n_41 : std_logic;
  signal n_42, n_43, n_44, n_45, n_46 : std_logic;
  signal n_47, n_48, n_49, n_50, n_51 : std_logic;
  signal n_52, n_53, n_54, n_55, n_56 : std_logic;
  signal n_57, n_58, n_59, n_60, n_61 : std_logic;
  signal n_62, n_63, n_64, n_65, n_66 : std_logic;
  signal n_67, n_68, n_69, n_70, n_71 : std_logic;
  signal n_72, n_73, n_74, n_75, n_76 : std_logic;
  signal n_77, n_78, n_79, n_80, n_81 : std_logic;
  signal n_82, n_83, n_84, n_85, n_86 : std_logic;
  signal n_87, n_88, n_89, n_90, n_91 : std_logic;
  signal n_92, n_93, n_94, n_95, n_96 : std_logic;
  signal n_97, n_98, n_99, n_100, n_101 : std_logic;
  signal n_102, n_103, n_104, n_105, n_106 : std_logic;
  signal n_107, n_108, n_109, n_110, n_111 : std_logic;
  signal n_112, n_113, n_114, n_115, n_116 : std_logic;
  signal n_117, n_118, n_119, n_120, n_121 : std_logic;
  signal n_122, n_123, n_124, n_125, n_126 : std_logic;
  signal n_127, n_128, n_129, n_130, n_131 : std_logic;
  signal n_132, n_133, n_134, n_135, n_136 : std_logic;
  signal n_137, n_138, n_139, n_140, n_141 : std_logic;
  signal n_142, n_143, n_144, n_145, n_146 : std_logic;
  signal n_147, n_148, n_149, n_150, n_151 : std_logic;
  signal n_152, n_153, n_154, n_155, n_156 : std_logic;
  signal n_157, n_158, n_159, n_160, n_161 : std_logic;
  signal n_162, n_163, n_164, n_165, n_166 : std_logic;
  signal n_167, n_168, n_169, n_170, n_171 : std_logic;
  signal n_172, n_173, n_174, n_175, n_176 : std_logic;
  signal n_177, n_178, n_179, n_180, n_181 : std_logic;
  signal n_182, n_183, n_184, n_185, n_186 : std_logic;
  signal n_187, n_188, n_189, n_190, n_191 : std_logic;
  signal n_192, n_193, n_194, n_195, n_196 : std_logic;
  signal n_197, n_198, n_199, n_200, n_201 : std_logic;
  signal n_202, n_203, n_204, n_205, n_206 : std_logic;
  signal n_207, n_208, n_209, n_210, n_211 : std_logic;
  signal n_212, n_213, n_214, n_215, n_216 : std_logic;
  signal n_217, n_218, n_219, n_220, n_221 : std_logic;
  signal n_222, n_223, n_224, n_225, n_226 : std_logic;
  signal n_227, n_228, n_229, n_230, n_231 : std_logic;
  signal n_232, n_233, n_234, n_235, n_236 : std_logic;
  signal n_237, n_238, n_239, n_240, n_241 : std_logic;
  signal n_242, n_243, n_244, n_245, n_246 : std_logic;
  signal n_247, n_248, n_249, n_250, n_251 : std_logic;
  signal n_252, n_253, n_254, n_255, n_256 : std_logic;
  signal n_257, n_258, n_259, n_260, n_261 : std_logic;
  signal n_262, n_263, n_264, n_265, n_266 : std_logic;
  signal n_267, n_268, n_269, n_270, n_271 : std_logic;
  signal n_272, n_273, n_274, n_275, n_276 : std_logic;
  signal n_277, n_278, n_279, n_280, n_281 : std_logic;
  signal n_282, n_283, n_284, n_285, n_286 : std_logic;
  signal n_287, n_288, n_289, n_290, n_291 : std_logic;
  signal n_292, n_293, n_294, n_295, n_296 : std_logic;
  signal n_297, n_298, n_299, n_300, n_301 : std_logic;
  signal n_302, n_303, n_304, n_305, n_306 : std_logic;
  signal n_307, n_308, n_309, n_310, n_311 : std_logic;
  signal n_312, n_313, n_314, n_315, n_316 : std_logic;
  signal n_317, n_318, n_319, n_320, n_321 : std_logic;
  signal n_322, n_323, n_324, n_325, n_326 : std_logic;
  signal n_327, n_328, n_329, n_330, n_331 : std_logic;
  signal n_332, n_333, n_334, n_335, n_336 : std_logic;
  signal n_337, n_338, n_339, n_340, n_341 : std_logic;
  signal n_342, n_343, n_344, n_345, n_346 : std_logic;
  signal n_347, n_348, n_349, n_350, n_351 : std_logic;
  signal n_352, n_353, n_354, n_355, n_356 : std_logic;
  signal n_357, n_358, n_359, n_360, n_361 : std_logic;
  signal n_362, n_363, n_364, n_365, n_366 : std_logic;
  signal n_367, n_368, n_369, n_370, n_371 : std_logic;
  signal n_372, n_373, n_374, n_375, n_376 : std_logic;
  signal n_377, n_378, n_379, n_380, n_381 : std_logic;
  signal n_382, n_383, n_384, n_386, n_387 : std_logic;
  signal n_388, n_389, n_390, n_391, n_392 : std_logic;
  signal n_393, n_394, n_395, n_396, n_397 : std_logic;
  signal n_398, n_399, n_400, n_401, n_402 : std_logic;
  signal n_403, n_404, n_405, n_406, n_407 : std_logic;
  signal n_408, n_409, n_410, n_411, n_412 : std_logic;
  signal n_413, n_414, n_415, n_416, n_417 : std_logic;
  signal n_418, n_419, n_420, n_421, n_422 : std_logic;
  signal n_423, n_424, n_425, n_426, n_427 : std_logic;
  signal n_428, n_429, n_430, n_431, n_432 : std_logic;
  signal n_433, n_434, n_435, n_436, n_437 : std_logic;
  signal n_438, n_439, n_440, n_441, n_442 : std_logic;
  signal n_443, n_444, n_445, n_446, n_447 : std_logic;
  signal n_448, n_449, n_450, n_451, n_452 : std_logic;
  signal n_453, n_454, n_455, n_456, n_457 : std_logic;
  signal n_458, n_459, n_460, n_461, n_462 : std_logic;
  signal n_463, n_464, n_465, n_466, n_467 : std_logic;
  signal n_468, n_469, n_470, n_471, n_472 : std_logic;
  signal n_473, n_474, n_475, n_476, n_477 : std_logic;
  signal n_478, n_479, n_480, n_481, n_482 : std_logic;
  signal n_483, n_484, n_485, n_486, n_487 : std_logic;
  signal n_488, n_489, n_490, n_491, n_492 : std_logic;
  signal n_493, n_494, n_495, n_496, n_497 : std_logic;
  signal n_498, n_499, n_500, n_501, n_502 : std_logic;
  signal n_503, n_504, n_505, n_506, n_507 : std_logic;
  signal n_508, n_509, n_510, n_511, n_512 : std_logic;
  signal n_513, n_514, n_515, n_516, n_517 : std_logic;
  signal n_518, n_519, n_520, n_521, n_522 : std_logic;
  signal n_523, n_524, n_525, n_526, n_527 : std_logic;
  signal n_528, n_529, n_530, n_531, n_532 : std_logic;
  signal n_533, n_534, n_535, n_536, n_537 : std_logic;
  signal n_538, n_539, n_540, n_541, n_542 : std_logic;
  signal n_543, n_544, n_545, n_546, n_547 : std_logic;
  signal n_548, n_549, n_550, n_551, n_552 : std_logic;
  signal n_553, n_554, n_555, n_556, n_557 : std_logic;
  signal n_558, n_559, n_560, n_561, n_562 : std_logic;
  signal n_563, n_564, n_565, n_566, n_567 : std_logic;
  signal n_568, n_569, n_570, n_571, n_572 : std_logic;
  signal n_573, n_574, n_575, n_576, n_577 : std_logic;
  signal n_578, n_579, n_580, n_581, n_582 : std_logic;
  signal n_583, n_587, n_588, n_589, n_931 : std_logic;

begin

  g26939 : INVD4BWP7T port map(I => n_589, ZN => rgb(1));
  g26941 : INVD4BWP7T port map(I => n_588, ZN => rgb(0));
  rgb_reg_1 : DFD0BWP7T port map(CP => clk, D => n_582, Q => UNCONNECTED, QN => n_589);
  rgb_reg_0 : DFD0BWP7T port map(CP => clk, D => n_583, Q => UNCONNECTED0, QN => n_588);
  g26943 : INVD4BWP7T port map(I => n_587, ZN => rgb(2));
  rgb_reg_2 : DFD0BWP7T port map(CP => clk, D => n_581, Q => UNCONNECTED1, QN => n_587);
  g26946 : AO221D0BWP7T port map(A1 => n_575, A2 => n_571, B1 => n_570, B2 => n_572, C => n_578, Z => n_583);
  g26944 : AOI211XD0BWP7T port map(A1 => n_576, A2 => n_580, B => n_579, C => n_563, ZN => n_582);
  g26945 : AOI221D0BWP7T port map(A1 => n_577, A2 => n_580, B1 => n_574, B2 => n_257, C => n_579, ZN => n_581);
  g26947 : INR2D1BWP7T port map(A1 => n_577, B1 => n_580, ZN => n_578);
  g26948 : OA31D1BWP7T port map(A1 => n_544, A2 => n_556, A3 => n_573, B => n_577, Z => n_576);
  g26949 : OAI211D1BWP7T port map(A1 => n_565, A2 => n_574, B => n_567, C => n_562, ZN => n_575);
  g26951 : OA211D0BWP7T port map(A1 => n_569, A2 => n_573, B => n_568, C => n_572, Z => n_577);
  g26952 : OAI31D0BWP7T port map(A1 => n_275, A2 => n_566, A3 => n_564, B => n_571, ZN => n_579);
  g26950 : OAI31D0BWP7T port map(A1 => n_559, A2 => n_569, A3 => n_573, B => n_568, ZN => n_570);
  g26957 : IND3D1BWP7T port map(A1 => n_566, B1 => n_565, B2 => n_564, ZN => n_567);
  g26953 : AOI21D0BWP7T port map(A1 => n_562, A2 => n_565, B => n_561, ZN => n_563);
  g26955 : ND2D1BWP7T port map(A1 => n_573, A2 => n_569, ZN => n_568);
  g26958 : ND4D0BWP7T port map(A1 => n_573, A2 => n_551, A3 => n_538, A4 => n_516, ZN => n_580);
  g26954 : INVD0BWP7T port map(I => n_561, ZN => n_574);
  g26956 : NR2XD0BWP7T port map(A1 => n_555, A2 => n_560, ZN => n_561);
  g26962 : AOI211XD0BWP7T port map(A1 => n_560, A2 => n_405, B => n_553, C => n_527, ZN => n_564);
  g26960 : OA221D0BWP7T port map(A1 => n_528, A2 => n_558, B1 => n_535, B2 => n_557, C => n_552, Z => n_569);
  g26963 : AOI222D0BWP7T port map(A1 => n_549, A2 => n_546, B1 => n_439, B2 => n_510, C1 => n_542, C2 => n_378, ZN => n_559);
  g26961 : OAI221D0BWP7T port map(A1 => n_558, A2 => n_525, B1 => n_557, B2 => n_533, C => n_554, ZN => n_573);
  g26964 : OAI211D1BWP7T port map(A1 => n_550, A2 => n_537, B => n_541, C => n_503, ZN => n_556);
  g26959 : OAI211D0BWP7T port map(A1 => n_543, A2 => n_417, B => n_547, C => n_513, ZN => n_555);
  g26965 : OAI21D0BWP7T port map(A1 => n_534, A2 => n_501, B => n_557, ZN => n_554);
  g26967 : OAI221D0BWP7T port map(A1 => n_486, A2 => n_526, B1 => n_520, B2 => n_531, C => n_519, ZN => n_553);
  g26969 : OAI21D0BWP7T port map(A1 => n_539, A2 => n_497, B => n_557, ZN => n_552);
  g26970 : AOI222D0BWP7T port map(A1 => n_560, A2 => n_461, B1 => n_498, B2 => n_540, C1 => n_545, C2 => n_550, ZN => n_551);
  g26983 : MAOI22D0BWP7T port map(A1 => n_431, A2 => n_548, B1 => n_521, B2 => n_548, ZN => n_549);
  g26968 : AOI222D0BWP7T port map(A1 => n_495, A2 => n_515, B1 => n_507, B2 => n_546, C1 => n_545, C2 => n_408, ZN => n_547);
  g26971 : OAI31D0BWP7T port map(A1 => n_389, A2 => n_423, A3 => n_543, B => n_530, ZN => n_544);
  g26972 : AOI211D1BWP7T port map(A1 => n_509, A2 => n_494, B => n_529, C => n_410, ZN => n_542);
  g26973 : AOI22D0BWP7T port map(A1 => n_522, A2 => n_540, B1 => n_545, B2 => n_388, ZN => n_541);
  g26982 : OA21D0BWP7T port map(A1 => n_504, A2 => n_536, B => n_514, Z => n_539);
  g26974 : MAOI22D0BWP7T port map(A1 => n_480, A2 => n_546, B1 => n_537, B2 => n_374, ZN => n_538);
  g26966 : IND2D0BWP7T port map(A1 => n_557, B1 => n_536, ZN => n_558);
  g26976 : AOI21D0BWP7T port map(A1 => n_506, A2 => n_532, B => n_499, ZN => n_535);
  g26979 : OA21D0BWP7T port map(A1 => n_505, A2 => n_536, B => n_511, Z => n_534);
  g26981 : AOI21D0BWP7T port map(A1 => n_508, A2 => n_532, B => n_502, ZN => n_533);
  g26984 : INVD0BWP7T port map(I => n_545, ZN => n_531);
  g26977 : AOI31D0BWP7T port map(A1 => n_454, A2 => n_546, A3 => n_548, B => n_512, ZN => n_530);
  g26997 : OAI211D1BWP7T port map(A1 => n_464, A2 => n_435, B => n_540, C => n_381, ZN => n_529);
  g27002 : AOI31D0BWP7T port map(A1 => n_524, A2 => n_523, A3 => playground(240), B => n_496, ZN => n_528);
  g26998 : AOI21D0BWP7T port map(A1 => n_419, A2 => n_393, B => n_543, ZN => n_527);
  g26990 : NR2D0BWP7T port map(A1 => n_526, A2 => n_453, ZN => n_560);
  g26991 : NR2D1BWP7T port map(A1 => n_543, A2 => n_437, ZN => n_545);
  g27013 : AOI31D0BWP7T port map(A1 => n_524, A2 => n_523, A3 => playground(241), B => n_489, ZN => n_525);
  g27004 : OAI211D1BWP7T port map(A1 => n_392, A2 => n_490, B => n_483, C => n_391, ZN => n_522);
  g27003 : AOI21D0BWP7T port map(A1 => n_484, A2 => n_520, B => n_493, ZN => n_521);
  g26978 : OAI21D0BWP7T port map(A1 => n_457, A2 => n_477, B => n_546, ZN => n_519);
  g26975 : MAOI22D0BWP7T port map(A1 => n_518, A2 => n_517, B1 => n_518, B2 => n_517, ZN => n_557);
  g26988 : OAI21D0BWP7T port map(A1 => n_413, A2 => n_421, B => n_515, ZN => n_516);
  g26995 : ND4D0BWP7T port map(A1 => n_471, A2 => n_455, A3 => n_444, A4 => n_536, ZN => n_514);
  g26992 : OAI21D0BWP7T port map(A1 => n_397, A2 => n_399, B => n_540, ZN => n_513);
  g26993 : OA21D0BWP7T port map(A1 => n_433, A2 => n_458, B => n_515, Z => n_512);
  g26994 : ND4D0BWP7T port map(A1 => n_473, A2 => n_467, A3 => n_445, A4 => n_536, ZN => n_511);
  g26989 : ND2D1BWP7T port map(A1 => n_510, A2 => n_509, ZN => n_537);
  g27009 : ND4D0BWP7T port map(A1 => n_443, A2 => n_460, A3 => n_452, A4 => n_449, ZN => n_508);
  g27010 : OAI22D0BWP7T port map(A1 => n_462, A2 => n_479, B1 => n_478, B2 => n_387, ZN => n_507);
  g27014 : ND4D0BWP7T port map(A1 => n_448, A2 => n_474, A3 => n_475, A4 => n_447, ZN => n_506);
  g27015 : ND4D0BWP7T port map(A1 => n_451, A2 => n_470, A3 => n_466, A4 => n_441, ZN => n_505);
  g27016 : ND4D0BWP7T port map(A1 => n_440, A2 => n_468, A3 => n_469, A4 => n_442, ZN => n_504);
  g26980 : ND3D0BWP7T port map(A1 => n_510, A2 => n_485, A3 => n_491, ZN => n_503);
  g26987 : AOI31D0BWP7T port map(A1 => n_345, A2 => n_354, A3 => n_339, B => n_500, ZN => n_502);
  g26986 : AOI31D0BWP7T port map(A1 => n_352, A2 => n_350, A3 => n_334, B => n_500, ZN => n_501);
  g26985 : AOI31D0BWP7T port map(A1 => n_357, A2 => n_355, A3 => n_347, B => n_500, ZN => n_499);
  g27056 : ND2D0BWP7T port map(A1 => n_459, A2 => n_456, ZN => n_498);
  g26996 : AOI31D0BWP7T port map(A1 => n_358, A2 => n_344, A3 => n_348, B => n_500, ZN => n_497);
  g27019 : OAI22D0BWP7T port map(A1 => n_359, A2 => n_488, B1 => n_362, B2 => n_487, ZN => n_496);
  g27018 : OAI221D0BWP7T port map(A1 => n_492, A2 => n_414, B1 => n_494, B2 => n_432, C => n_476, ZN => n_495);
  g27021 : OAI221D0BWP7T port map(A1 => n_492, A2 => n_491, B1 => n_463, B2 => n_490, C => n_465, ZN => n_493);
  g27020 : OAI22D0BWP7T port map(A1 => n_360, A2 => n_488, B1 => n_364, B2 => n_487, ZN => n_489);
  g27000 : INVD0BWP7T port map(I => n_540, ZN => n_526);
  g27001 : CKND1BWP7T port map(I => n_510, ZN => n_543);
  g27061 : AOI221D0BWP7T port map(A1 => n_485, A2 => n_371, B1 => n_484, B2 => n_550, C => n_415, ZN => n_486);
  g27047 : AOI211XD0BWP7T port map(A1 => n_485, A2 => n_438, B => n_425, C => n_383, ZN => n_483);
  g26999 : MAOI22D0BWP7T port map(A1 => n_482, A2 => n_481, B1 => n_482, B2 => n_481, ZN => n_518);
  g27005 : INR2D1BWP7T port map(A1 => n_546, B1 => n_548, ZN => n_515);
  g27011 : OAI22D0BWP7T port map(A1 => n_479, A2 => n_366, B1 => n_478, B2 => n_369, ZN => n_480);
  g27012 : OAI32D0BWP7T port map(A1 => n_491, A2 => n_479, A3 => n_424, B1 => n_478, B2 => n_390, ZN => n_477);
  g27008 : NR2D1BWP7T port map(A1 => n_546, A2 => n_548, ZN => n_510);
  g27007 : NR2D1BWP7T port map(A1 => n_546, A2 => n_479, ZN => n_540);
  g27048 : AOI211XD0BWP7T port map(A1 => n_484, A2 => n_400, B => n_409, C => n_398, ZN => n_476);
  g27031 : OAI21D0BWP7T port map(A1 => n_296, A2 => n_328, B => n_524, ZN => n_475);
  g27032 : OAI21D0BWP7T port map(A1 => n_298, A2 => n_326, B => n_472, ZN => n_474);
  g27033 : OAI21D0BWP7T port map(A1 => n_302, A2 => n_327, B => n_472, ZN => n_473);
  g27038 : OAI21D0BWP7T port map(A1 => n_290, A2 => n_316, B => n_472, ZN => n_471);
  g27039 : OAI21D0BWP7T port map(A1 => n_288, A2 => n_312, B => n_472, ZN => n_470);
  g27042 : OAI21D0BWP7T port map(A1 => n_287, A2 => n_313, B => n_524, ZN => n_469);
  g27043 : OAI21D0BWP7T port map(A1 => n_286, A2 => n_311, B => n_472, ZN => n_468);
  g27030 : OAI21D0BWP7T port map(A1 => n_297, A2 => n_320, B => n_524, ZN => n_467);
  g27049 : OAI21D0BWP7T port map(A1 => n_291, A2 => n_315, B => n_524, ZN => n_466);
  g27064 : AOI31D0BWP7T port map(A1 => n_434, A2 => n_464, A3 => n_463, B => n_422, ZN => n_465);
  g27065 : IAO21D0BWP7T port map(A1 => n_411, A2 => n_461, B => n_426, ZN => n_462);
  g27027 : OAI21D0BWP7T port map(A1 => n_300, A2 => n_324, B => n_472, ZN => n_460);
  g27084 : AOI211XD0BWP7T port map(A1 => n_485, A2 => n_382, B => n_458, C => n_380, ZN => n_459);
  g27022 : OAI22D0BWP7T port map(A1 => n_406, A2 => n_548, B1 => n_456, B2 => n_416, ZN => n_457);
  g27024 : OAI21D0BWP7T port map(A1 => n_292, A2 => n_310, B => n_524, ZN => n_455);
  g27025 : OAI211D0BWP7T port map(A1 => n_430, A2 => n_453, B => n_401, C => n_394, ZN => n_454);
  g27026 : OAI21D0BWP7T port map(A1 => n_301, A2 => n_325, B => n_524, ZN => n_452);
  g27006 : ND2D1BWP7T port map(A1 => n_450, A2 => n_536, ZN => n_500);
  g27041 : OAI21D0BWP7T port map(A1 => n_285, A2 => n_309, B => n_450, ZN => n_451);
  g27029 : OAI21D0BWP7T port map(A1 => n_299, A2 => n_322, B => n_446, ZN => n_449);
  g27034 : OAI21D0BWP7T port map(A1 => n_303, A2 => n_321, B => n_450, ZN => n_448);
  g27035 : OAI21D0BWP7T port map(A1 => n_304, A2 => n_318, B => n_446, ZN => n_447);
  g27036 : OAI21D0BWP7T port map(A1 => n_293, A2 => n_319, B => n_446, ZN => n_445);
  g27040 : OAI21D0BWP7T port map(A1 => n_289, A2 => n_314, B => n_446, ZN => n_444);
  g27028 : OAI21D0BWP7T port map(A1 => n_305, A2 => n_323, B => n_450, ZN => n_443);
  g27045 : OAI21D0BWP7T port map(A1 => n_283, A2 => n_308, B => n_446, ZN => n_442);
  g27046 : OAI21D0BWP7T port map(A1 => n_282, A2 => n_307, B => n_446, ZN => n_441);
  g27044 : OAI21D0BWP7T port map(A1 => n_284, A2 => n_317, B => n_450, ZN => n_440);
  g27062 : OA211D0BWP7T port map(A1 => n_438, A2 => n_437, B => n_379, C => n_456, Z => n_439);
  g27017 : INVD0BWP7T port map(I => n_536, ZN => n_532);
  g27054 : INVD0BWP7T port map(I => n_472, ZN => n_487);
  g27023 : MAOI22D0BWP7T port map(A1 => n_436, A2 => input_v_map(5), B1 => n_436, B2 => input_v_map(5), ZN => n_546);
  g27070 : NR2D1BWP7T port map(A1 => n_931, A2 => n_434, ZN => n_435);
  g27068 : OAI211D0BWP7T port map(A1 => n_341, A2 => n_432, B => n_377, C => n_368, ZN => n_433);
  g27063 : OAI211D0BWP7T port map(A1 => n_464, A2 => n_430, B => n_376, C => n_437, ZN => n_431);
  g27050 : MAOI222D1BWP7T port map(A => n_429, B => n_281, C => n_280, ZN => n_482);
  g27053 : INVD0BWP7T port map(I => n_446, ZN => n_488);
  g27037 : ND2D1BWP7T port map(A1 => n_548, A2 => n_464, ZN => n_478);
  g27051 : MOAI22D0BWP7T port map(A1 => n_429, A2 => n_428, B1 => n_429, B2 => n_428, ZN => n_536);
  g27059 : NR2XD0BWP7T port map(A1 => n_427, A2 => n_402, ZN => n_472);
  g27060 : NR2D1BWP7T port map(A1 => n_404, A2 => n_427, ZN => n_524);
  g27082 : AOI22D0BWP7T port map(A1 => n_372, A2 => n_453, B1 => n_437, B2 => n_332, ZN => n_426);
  g27073 : AOI21D0BWP7T port map(A1 => n_424, A2 => n_423, B => n_420, ZN => n_425);
  g27075 : AOI21D0BWP7T port map(A1 => n_423, A2 => n_437, B => n_412, ZN => n_422);
  g27076 : OAI22D0BWP7T port map(A1 => n_432, A2 => n_365, B1 => n_418, B2 => n_420, ZN => n_421);
  g27078 : AO21D0BWP7T port map(A1 => n_418, A2 => n_432, B => n_420, Z => n_419);
  g27079 : AOI22D0BWP7T port map(A1 => n_367, A2 => n_416, B1 => n_407, B2 => n_464, ZN => n_417);
  g27080 : OAI22D0BWP7T port map(A1 => n_418, A2 => n_416, B1 => n_396, B2 => n_414, ZN => n_415);
  g27081 : OAI22D0BWP7T port map(A1 => n_492, A2 => n_412, B1 => n_411, B2 => n_340, ZN => n_413);
  g27071 : AOI21D0BWP7T port map(A1 => n_490, A2 => n_492, B => n_412, ZN => n_410);
  g27069 : OA31D1BWP7T port map(A1 => n_408, A2 => n_407, A3 => n_434, B => n_395, Z => n_409);
  g27077 : AOI211D0BWP7T port map(A1 => n_509, A2 => n_405, B => n_386, C => n_484, ZN => n_406);
  g27052 : INVD1BWP7T port map(I => n_548, ZN => n_479);
  g27057 : NR2XD0BWP7T port map(A1 => n_404, A2 => n_403, ZN => n_450);
  g27058 : NR2D1BWP7T port map(A1 => n_403, A2 => n_402, ZN => n_446);
  g27083 : MAOI22D0BWP7T port map(A1 => n_485, A2 => n_400, B1 => n_424, B2 => n_399, ZN => n_401);
  g27087 : NR2D1BWP7T port map(A1 => n_423, A2 => n_306, ZN => n_398);
  g27088 : OA21D0BWP7T port map(A1 => n_396, A2 => n_395, B => n_418, Z => n_397);
  g27095 : MAOI22D0BWP7T port map(A1 => n_484, A2 => n_461, B1 => n_437, B2 => n_550, ZN => n_394);
  g27091 : OAI21D0BWP7T port map(A1 => n_509, A2 => n_484, B => n_494, ZN => n_393);
  g27089 : NR2D1BWP7T port map(A1 => n_418, A2 => n_392, ZN => n_458);
  g27055 : FA1D0BWP7T port map(A => n_3, B => n_136, CI => n_331, CO => n_436, S => n_548);
  g27074 : OAI211D1BWP7T port map(A1 => n_384, A2 => n_434, B => n_395, C => n_330, ZN => n_391);
  g27072 : AOI221D0BWP7T port map(A1 => n_434, A2 => n_389, B1 => n_363, B2 => n_388, C => n_407, ZN => n_390);
  g27085 : NR2D0BWP7T port map(A1 => n_386, A2 => n_389, ZN => n_387);
  g27066 : INVD0BWP7T port map(I => n_403, ZN => n_427);
  g27093 : MOAI22D0BWP7T port map(A1 => n_453, A2 => n_382, B1 => n_370, B2 => n_408, ZN => n_383);
  g27102 : INVD0BWP7T port map(I => n_380, ZN => n_381);
  g27098 : ND2D1BWP7T port map(A1 => n_484, A2 => n_373, ZN => n_456);
  g27067 : FA1D0BWP7T port map(A => n_272, B => n_273, CI => n_329, CO => n_429, S => n_403);
  g27086 : AO21D0BWP7T port map(A1 => n_453, A2 => n_378, B => n_407, Z => n_379);
  g27090 : OAI211D0BWP7T port map(A1 => n_388, A2 => n_342, B => n_343, C => n_395, ZN => n_377);
  g27092 : MAOI22D0BWP7T port map(A1 => n_485, A2 => n_550, B1 => n_375, B2 => n_374, ZN => n_376);
  g27100 : ND2D1BWP7T port map(A1 => n_509, A2 => n_373, ZN => n_492);
  g27099 : ND2D1BWP7T port map(A1 => n_384, A2 => n_464, ZN => n_423);
  g27101 : ND2D1BWP7T port map(A1 => n_384, A2 => n_395, ZN => n_418);
  g27103 : IOA21D0BWP7T port map(A1 => n_371, A2 => n_550, B => n_370, ZN => n_372);
  g27104 : AN2D0BWP7T port map(A1 => n_384, A2 => n_388, Z => n_369);
  g27105 : OAI21D0BWP7T port map(A1 => n_400, A2 => n_408, B => n_509, ZN => n_368);
  g27106 : OAI21D0BWP7T port map(A1 => n_373, A2 => n_464, B => n_432, ZN => n_367);
  g27107 : OA21D0BWP7T port map(A1 => n_365, A2 => n_464, B => n_437, Z => n_366);
  g27108 : NR2D0BWP7T port map(A1 => n_411, A2 => n_412, ZN => n_380);
  g27130 : AOI221D0BWP7T port map(A1 => n_523, A2 => playground(225), B1 => n_361, B2 => n_243, C => n_337, ZN => n_364);
  g27109 : AN2D1BWP7T port map(A1 => n_434, A2 => n_392, Z => n_386);
  g27097 : ND2D1BWP7T port map(A1 => n_363, A2 => n_395, ZN => n_424);
  g27096 : ND2D1BWP7T port map(A1 => n_363, A2 => n_464, ZN => n_490);
  g27128 : AOI221D0BWP7T port map(A1 => n_361, A2 => n_248, B1 => n_523, B2 => playground(224), C => n_336, ZN => n_362);
  g27127 : AOI221D0BWP7T port map(A1 => n_361, A2 => n_256, B1 => n_523, B2 => playground(193), C => n_338, ZN => n_360);
  g27129 : AOI221D0BWP7T port map(A1 => n_361, A2 => n_245, B1 => n_523, B2 => playground(192), C => n_335, ZN => n_359);
  g27111 : INVD1BWP7T port map(I => n_411, ZN => n_484);
  g27132 : AOI222D0BWP7T port map(A1 => n_523, A2 => playground(80), B1 => n_361, B2 => n_165, C1 => n_356, C2 => playground(92), ZN => n_358);
  g27131 : AOI222D0BWP7T port map(A1 => n_523, A2 => playground(208), B1 => n_361, B2 => n_164, C1 => n_356, C2 => playground(220), ZN => n_357);
  g27115 : NR2D1BWP7T port map(A1 => n_375, A2 => n_371, ZN => n_407);
  g27112 : CKND1BWP7T port map(I => n_453, ZN => n_509);
  g27118 : INVD1BWP7T port map(I => n_437, ZN => n_370);
  g27116 : ND2D1BWP7T port map(A1 => n_375, A2 => n_395, ZN => n_411);
  g27119 : CKND1BWP7T port map(I => n_485, ZN => n_432);
  g27121 : NR2D0BWP7T port map(A1 => n_375, A2 => n_373, ZN => n_384);
  g27137 : AOI22D0BWP7T port map(A1 => n_351, A2 => playground(210), B1 => n_353, B2 => playground(212), ZN => n_355);
  g27134 : AOI22D0BWP7T port map(A1 => n_353, A2 => playground(213), B1 => n_349, B2 => playground(215), ZN => n_354);
  g27135 : AOI22D0BWP7T port map(A1 => n_523, A2 => playground(81), B1 => n_351, B2 => playground(83), ZN => n_352);
  g27136 : AOI22D0BWP7T port map(A1 => n_353, A2 => playground(85), B1 => n_349, B2 => playground(87), ZN => n_350);
  g27133 : AOI22D0BWP7T port map(A1 => n_346, A2 => playground(88), B1 => n_349, B2 => playground(86), ZN => n_348);
  g27138 : AOI22D0BWP7T port map(A1 => n_346, A2 => playground(216), B1 => n_349, B2 => playground(214), ZN => n_347);
  g27139 : AOI22D0BWP7T port map(A1 => n_523, A2 => playground(209), B1 => n_351, B2 => playground(211), ZN => n_345);
  g27146 : AOI22D0BWP7T port map(A1 => n_351, A2 => playground(82), B1 => n_353, B2 => playground(84), ZN => n_344);
  g27120 : OAI21D0BWP7T port map(A1 => n_396, A2 => n_416, B => n_342, ZN => n_343);
  g27198 : AOI21D0BWP7T port map(A1 => n_396, A2 => n_412, B => n_340, ZN => n_341);
  g27166 : NR2D0BWP7T port map(A1 => n_438, A2 => n_494, ZN => n_365);
  g27114 : NR2D1BWP7T port map(A1 => n_342, A2 => n_373, ZN => n_363);
  g27122 : NR2XD0BWP7T port map(A1 => n_342, A2 => n_396, ZN => n_434);
  g27117 : ND2D1BWP7T port map(A1 => n_342, A2 => n_464, ZN => n_453);
  g27124 : NR2D1BWP7T port map(A1 => n_342, A2 => n_395, ZN => n_485);
  g27123 : ND2D1BWP7T port map(A1 => n_342, A2 => n_395, ZN => n_437);
  g27142 : MAOI22D0BWP7T port map(A1 => n_356, A2 => playground(221), B1 => n_333, B2 => n_250, ZN => n_339);
  g27141 : MOAI22D0BWP7T port map(A1 => n_361, A2 => n_255, B1 => n_356, B2 => playground(205), ZN => n_338);
  g27140 : MOAI22D0BWP7T port map(A1 => n_361, A2 => n_244, B1 => n_356, B2 => playground(237), ZN => n_337);
  g27143 : MOAI22D0BWP7T port map(A1 => n_361, A2 => n_252, B1 => n_356, B2 => playground(236), ZN => n_336);
  g27144 : MOAI22D0BWP7T port map(A1 => n_361, A2 => n_247, B1 => n_356, B2 => playground(204), ZN => n_335);
  g27145 : MAOI22D0BWP7T port map(A1 => n_356, A2 => playground(93), B1 => n_333, B2 => n_246, ZN => n_334);
  g27206 : INVD0BWP7T port map(I => n_340, ZN => n_382);
  g27207 : INVD0BWP7T port map(I => n_438, ZN => n_520);
  g27199 : OA21D0BWP7T port map(A1 => n_373, A2 => n_416, B => n_405, Z => n_430);
  g27125 : INVD1BWP7T port map(I => n_342, ZN => n_375);
  g27208 : INVD1BWP7T port map(I => n_332, ZN => n_550);
  g27126 : FA1D0BWP7T port map(A => n_120, B => n_94, CI => n_271, CO => n_331, S => n_342);
  g27201 : NR2XD0BWP7T port map(A1 => n_396, A2 => n_463, ZN => n_374);
  g27203 : ND2D1BWP7T port map(A1 => n_396, A2 => n_392, ZN => n_371);
  g27210 : NR2D1BWP7T port map(A1 => n_396, A2 => n_330, ZN => n_408);
  g27213 : NR2XD0BWP7T port map(A1 => n_396, A2 => n_420, ZN => n_332);
  g27110 : INVD1BWP7T port map(I => n_402, ZN => n_404);
  g27211 : NR2XD0BWP7T port map(A1 => n_396, A2 => n_399, ZN => n_340);
  g27212 : NR2XD0BWP7T port map(A1 => n_396, A2 => n_389, ZN => n_438);
  g27113 : FA1D0BWP7T port map(A => n_274, B => n_190, CI => n_268, CO => n_329, S => n_402);
  g27164 : AOI21D0BWP7T port map(A1 => n_157, A2 => n_156, B => n_361, ZN => n_328);
  g27151 : AOI21D0BWP7T port map(A1 => n_184, A2 => n_148, B => n_361, ZN => n_327);
  g27153 : AOI21D0BWP7T port map(A1 => n_163, A2 => n_152, B => n_361, ZN => n_326);
  g27155 : AOI21D0BWP7T port map(A1 => n_180, A2 => n_179, B => n_361, ZN => n_325);
  g27157 : AOI21D0BWP7T port map(A1 => n_176, A2 => n_175, B => n_361, ZN => n_324);
  g27159 : AOI21D0BWP7T port map(A1 => n_172, A2 => n_171, B => n_361, ZN => n_323);
  g27161 : AOI21D0BWP7T port map(A1 => n_191, A2 => n_167, B => n_361, ZN => n_322);
  g27149 : AOI21D0BWP7T port map(A1 => n_147, A2 => n_146, B => n_361, ZN => n_321);
  g27165 : AOI21D0BWP7T port map(A1 => n_158, A2 => n_155, B => n_361, ZN => n_320);
  g27175 : AOI21D0BWP7T port map(A1 => n_192, A2 => n_200, B => n_361, ZN => n_319);
  g27174 : AOI21D0BWP7T port map(A1 => n_206, A2 => n_185, B => n_361, ZN => n_318);
  g27169 : NR2XD0BWP7T port map(A1 => n_361, A2 => n_294, ZN => n_353);
  g27170 : NR2XD0BWP7T port map(A1 => n_361, A2 => n_142, ZN => n_349);
  g27168 : NR2XD0BWP7T port map(A1 => n_361, A2 => n_127, ZN => n_351);
  g27172 : NR2XD0BWP7T port map(A1 => n_361, A2 => n_295, ZN => n_523);
  g27192 : AOI21D0BWP7T port map(A1 => n_214, A2 => n_202, B => n_361, ZN => n_317);
  g27180 : AOI21D0BWP7T port map(A1 => n_232, A2 => n_199, B => n_361, ZN => n_316);
  g27181 : AOI21D0BWP7T port map(A1 => n_231, A2 => n_233, B => n_361, ZN => n_315);
  g27184 : AOI21D0BWP7T port map(A1 => n_166, A2 => n_204, B => n_361, ZN => n_314);
  g27186 : AOI21D0BWP7T port map(A1 => n_226, A2 => n_225, B => n_361, ZN => n_313);
  g27187 : AOI21D0BWP7T port map(A1 => n_222, A2 => n_198, B => n_361, ZN => n_312);
  g27190 : AOI21D0BWP7T port map(A1 => n_219, A2 => n_221, B => n_361, ZN => n_311);
  g27177 : AOI21D0BWP7T port map(A1 => n_239, A2 => n_238, B => n_361, ZN => n_310);
  g27193 : AOI21D0BWP7T port map(A1 => n_213, A2 => n_215, B => n_361, ZN => n_309);
  g27195 : AOI21D0BWP7T port map(A1 => n_211, A2 => n_205, B => n_361, ZN => n_308);
  g27197 : AOI21D0BWP7T port map(A1 => n_207, A2 => n_208, B => n_361, ZN => n_307);
  g27204 : CKAN2D1BWP7T port map(A1 => n_373, A2 => n_420, Z => n_461);
  g27202 : INR2D1BWP7T port map(A1 => n_306, B1 => n_373, ZN => n_400);
  g27209 : INR2D0BWP7T port map(A1 => n_420, B1 => n_373, ZN => n_494);
  g27205 : ND2D1BWP7T port map(A1 => n_373, A2 => n_463, ZN => n_405);
  g27158 : AOI21D0BWP7T port map(A1 => n_173, A2 => n_174, B => n_333, ZN => n_305);
  g27148 : AOI21D0BWP7T port map(A1 => n_183, A2 => n_186, B => n_333, ZN => n_304);
  g27150 : AOI21D0BWP7T port map(A1 => n_149, A2 => n_150, B => n_333, ZN => n_303);
  g27152 : AOI21D0BWP7T port map(A1 => n_196, A2 => n_151, B => n_333, ZN => n_302);
  g27154 : AOI21D0BWP7T port map(A1 => n_181, A2 => n_182, B => n_333, ZN => n_301);
  g27156 : AOI21D0BWP7T port map(A1 => n_177, A2 => n_178, B => n_333, ZN => n_300);
  g27147 : AOI21D0BWP7T port map(A1 => n_169, A2 => n_170, B => n_333, ZN => n_299);
  g27160 : AOI21D0BWP7T port map(A1 => n_153, A2 => n_154, B => n_333, ZN => n_298);
  g27162 : AOI21D0BWP7T port map(A1 => n_161, A2 => n_162, B => n_333, ZN => n_297);
  g27163 : AOI21D0BWP7T port map(A1 => n_159, A2 => n_160, B => n_333, ZN => n_296);
  g27167 : NR2D0BWP7T port map(A1 => n_333, A2 => n_295, ZN => n_346);
  g27171 : NR2D1BWP7T port map(A1 => n_333, A2 => n_294, ZN => n_356);
  g27173 : AOI21D0BWP7T port map(A1 => n_188, A2 => n_187, B => n_333, ZN => n_293);
  g27176 : AOI21D0BWP7T port map(A1 => n_240, A2 => n_241, B => n_333, ZN => n_292);
  g27178 : AOI21D0BWP7T port map(A1 => n_234, A2 => n_237, B => n_333, ZN => n_291);
  g27179 : AOI21D0BWP7T port map(A1 => n_235, A2 => n_236, B => n_333, ZN => n_290);
  g27182 : AOI21D0BWP7T port map(A1 => n_230, A2 => n_197, B => n_333, ZN => n_289);
  g27183 : AOI21D0BWP7T port map(A1 => n_203, A2 => n_229, B => n_333, ZN => n_288);
  g27185 : AOI21D0BWP7T port map(A1 => n_227, A2 => n_228, B => n_333, ZN => n_287);
  g27188 : AOI21D0BWP7T port map(A1 => n_223, A2 => n_224, B => n_333, ZN => n_286);
  g27189 : AOI21D0BWP7T port map(A1 => n_218, A2 => n_220, B => n_333, ZN => n_285);
  g27191 : AOI21D0BWP7T port map(A1 => n_216, A2 => n_217, B => n_333, ZN => n_284);
  g27194 : AOI21D0BWP7T port map(A1 => n_212, A2 => n_201, B => n_333, ZN => n_283);
  g27196 : AOI21D0BWP7T port map(A1 => n_210, A2 => n_209, B => n_333, ZN => n_282);
  g27214 : INVD1BWP7T port map(I => n_373, ZN => n_396);
  g27200 : INVD1BWP7T port map(I => n_333, ZN => n_361);
  g27216 : XNR2D1BWP7T port map(A1 => n_281, A2 => n_280, ZN => n_428);
  g27217 : MOAI22D0BWP7T port map(A1 => n_279, A2 => n_278, B1 => n_279, B2 => n_278, ZN => n_373);
  g27215 : MAOI22D1BWP7T port map(A1 => n_277, A2 => n_276, B1 => n_277, B2 => n_276, ZN => n_333);
  g27224 : INR2D1BWP7T port map(A1 => n_566, B1 => n_275, ZN => n_572);
  g27221 : FA1D0BWP7T port map(A => n_123, B => x_map(3), CI => n_259, CO => n_273, S => n_274);
  g27218 : FA1D0BWP7T port map(A => n_258, B => n_86, CI => n_168, CO => n_281, S => n_272);
  g27222 : MAOI222D1BWP7T port map(A => n_270, B => n_278, C => n_269, ZN => n_271);
  g27223 : XNR2D1BWP7T port map(A1 => n_270, A2 => n_269, ZN => n_279);
  g27228 : NR4D0BWP7T port map(A1 => n_265, A2 => n_194, A3 => n_137, A4 => n_132, ZN => n_566);
  g27219 : MAOI222D0BWP7T port map(A => n_267, B => n_266, C => n_140, ZN => n_268);
  g27220 : MOAI22D0BWP7T port map(A1 => n_267, A2 => n_266, B1 => n_267, B2 => n_266, ZN => n_277);
  g27225 : ND2D1BWP7T port map(A1 => n_464, A2 => n_389, ZN => n_378);
  g27226 : INVD1BWP7T port map(I => n_464, ZN => n_395);
  g27230 : OAI21D0BWP7T port map(A1 => n_263, A2 => n_262, B => n_264, ZN => n_280);
  g27227 : FA1D0BWP7T port map(A => n_97, B => n_90, CI => n_141, CO => n_270, S => n_464);
  g27233 : IND4D0BWP7T port map(A1 => n_138, B1 => n_242, B2 => n_193, B3 => n_195, ZN => n_265);
  g27300 : ND3D0BWP7T port map(A1 => n_562, A2 => n_565, A3 => n_571, ZN => n_275);
  g27239 : CKND1BWP7T port map(I => n_330, ZN => n_491);
  g27231 : OAI21D0BWP7T port map(A1 => n_263, A2 => n_260, B => n_262, ZN => n_264);
  g27229 : MAOI22D0BWP7T port map(A1 => n_261, A2 => x_map(1), B1 => n_261, B2 => x_map(1), ZN => n_267);
  g27235 : OAI21D0BWP7T port map(A1 => n_260, A2 => n_96, B => n_189, ZN => n_517);
  g27245 : NR2XD0BWP7T port map(A1 => n_412, A2 => n_388, ZN => n_330);
  g27232 : FA1D0BWP7T port map(A => n_262, B => y_map(0), CI => n_124, CO => n_258, S => n_259);
  g27369 : INVD0BWP7T port map(I => n_562, ZN => n_257);
  g27240 : AO222D0BWP7T port map(A1 => n_249, A2 => playground(201), B1 => n_254, B2 => playground(203), C1 => n_253, C2 => playground(207), Z => n_256);
  g27241 : AOI222D0BWP7T port map(A1 => n_251, A2 => playground(197), B1 => n_254, B2 => playground(195), C1 => n_253, C2 => playground(199), ZN => n_255);
  g27242 : AOI222D0BWP7T port map(A1 => n_251, A2 => playground(228), B1 => n_254, B2 => playground(226), C1 => n_253, C2 => playground(230), ZN => n_252);
  g27243 : AOI222D0BWP7T port map(A1 => n_249, A2 => playground(217), B1 => n_253, B2 => playground(223), C1 => n_254, C2 => playground(219), ZN => n_250);
  g27246 : AO222D0BWP7T port map(A1 => n_249, A2 => playground(232), B1 => n_254, B2 => playground(234), C1 => n_253, C2 => playground(238), Z => n_248);
  g27247 : AOI222D0BWP7T port map(A1 => n_251, A2 => playground(196), B1 => n_254, B2 => playground(194), C1 => n_253, C2 => playground(198), ZN => n_247);
  g27248 : AOI222D0BWP7T port map(A1 => n_249, A2 => playground(89), B1 => n_253, B2 => playground(95), C1 => n_254, C2 => playground(91), ZN => n_246);
  g27249 : AO222D0BWP7T port map(A1 => n_249, A2 => playground(200), B1 => n_254, B2 => playground(202), C1 => n_253, C2 => playground(206), Z => n_245);
  g27250 : AOI222D0BWP7T port map(A1 => n_251, A2 => playground(229), B1 => n_254, B2 => playground(227), C1 => n_253, C2 => playground(231), ZN => n_244);
  g27251 : AO222D0BWP7T port map(A1 => n_249, A2 => playground(233), B1 => n_254, B2 => playground(235), C1 => n_253, C2 => playground(239), Z => n_243);
  g27255 : CKND1BWP7T port map(I => n_389, ZN => n_416);
  g27370 : ND4D0BWP7T port map(A1 => n_130, A2 => n_16, A3 => n_39, A4 => bomb_c_enable, ZN => n_242);
  g27307 : AOI22D0BWP7T port map(A1 => n_251, A2 => playground(124), B1 => n_253, B2 => playground(126), ZN => n_241);
  g27308 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(120), B1 => n_254, B2 => playground(122), ZN => n_240);
  g27309 : AOI22D0BWP7T port map(A1 => n_254, A2 => playground(114), B1 => n_253, B2 => playground(118), ZN => n_239);
  g27310 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(112), B1 => n_251, B2 => playground(116), ZN => n_238);
  g27311 : AOI22D0BWP7T port map(A1 => n_251, A2 => playground(61), B1 => n_253, B2 => playground(63), ZN => n_237);
  g27312 : AOI22D0BWP7T port map(A1 => n_251, A2 => playground(108), B1 => n_253, B2 => playground(110), ZN => n_236);
  g27313 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(104), B1 => n_254, B2 => playground(106), ZN => n_235);
  g27314 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(57), B1 => n_254, B2 => playground(59), ZN => n_234);
  g27315 : AOI22D0BWP7T port map(A1 => n_254, A2 => playground(51), B1 => n_253, B2 => playground(55), ZN => n_233);
  g27316 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(96), B1 => n_251, B2 => playground(100), ZN => n_232);
  g27317 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(49), B1 => n_251, B2 => playground(53), ZN => n_231);
  g27318 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(72), B1 => n_254, B2 => playground(74), ZN => n_230);
  g27319 : AOI22D0BWP7T port map(A1 => n_251, A2 => playground(45), B1 => n_253, B2 => playground(47), ZN => n_229);
  g27320 : AOI22D0BWP7T port map(A1 => n_251, A2 => playground(60), B1 => n_253, B2 => playground(62), ZN => n_228);
  g27321 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(56), B1 => n_254, B2 => playground(58), ZN => n_227);
  g27322 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(48), B1 => n_251, B2 => playground(52), ZN => n_226);
  g27323 : AOI22D0BWP7T port map(A1 => n_254, A2 => playground(50), B1 => n_253, B2 => playground(54), ZN => n_225);
  g27324 : AOI22D0BWP7T port map(A1 => n_251, A2 => playground(44), B1 => n_253, B2 => playground(46), ZN => n_224);
  g27325 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(40), B1 => n_254, B2 => playground(42), ZN => n_223);
  g27326 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(33), B1 => n_251, B2 => playground(37), ZN => n_222);
  g27327 : AOI22D0BWP7T port map(A1 => n_254, A2 => playground(34), B1 => n_253, B2 => playground(38), ZN => n_221);
  g27328 : AOI22D0BWP7T port map(A1 => n_251, A2 => playground(29), B1 => n_253, B2 => playground(31), ZN => n_220);
  g27329 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(32), B1 => n_251, B2 => playground(36), ZN => n_219);
  g27330 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(25), B1 => n_254, B2 => playground(27), ZN => n_218);
  g27331 : AOI22D0BWP7T port map(A1 => n_251, A2 => playground(28), B1 => n_253, B2 => playground(30), ZN => n_217);
  g27332 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(24), B1 => n_254, B2 => playground(26), ZN => n_216);
  g27333 : AOI22D0BWP7T port map(A1 => n_254, A2 => playground(19), B1 => n_253, B2 => playground(23), ZN => n_215);
  g27334 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(16), B1 => n_251, B2 => playground(20), ZN => n_214);
  g27335 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(17), B1 => n_251, B2 => playground(21), ZN => n_213);
  g27336 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(8), B1 => n_254, B2 => playground(10), ZN => n_212);
  g27337 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(0), B1 => n_251, B2 => playground(4), ZN => n_211);
  g27338 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(9), B1 => n_254, B2 => playground(11), ZN => n_210);
  g27339 : AOI22D0BWP7T port map(A1 => n_251, A2 => playground(13), B1 => n_253, B2 => playground(15), ZN => n_209);
  g27340 : AOI22D0BWP7T port map(A1 => n_254, A2 => playground(3), B1 => n_253, B2 => playground(7), ZN => n_208);
  g27341 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(1), B1 => n_251, B2 => playground(5), ZN => n_207);
  g27342 : AOI22D0BWP7T port map(A1 => n_254, A2 => playground(130), B1 => n_253, B2 => playground(134), ZN => n_206);
  g27343 : AOI22D0BWP7T port map(A1 => n_254, A2 => playground(2), B1 => n_253, B2 => playground(6), ZN => n_205);
  g27344 : AOI22D0BWP7T port map(A1 => n_254, A2 => playground(66), B1 => n_253, B2 => playground(70), ZN => n_204);
  g27345 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(41), B1 => n_254, B2 => playground(43), ZN => n_203);
  g27346 : AOI22D0BWP7T port map(A1 => n_254, A2 => playground(18), B1 => n_253, B2 => playground(22), ZN => n_202);
  g27347 : AOI22D0BWP7T port map(A1 => n_251, A2 => playground(12), B1 => n_253, B2 => playground(14), ZN => n_201);
  g27348 : AOI22D0BWP7T port map(A1 => n_254, A2 => playground(67), B1 => n_253, B2 => playground(71), ZN => n_200);
  g27349 : AOI22D0BWP7T port map(A1 => n_254, A2 => playground(98), B1 => n_253, B2 => playground(102), ZN => n_199);
  g27350 : AOI22D0BWP7T port map(A1 => n_254, A2 => playground(35), B1 => n_253, B2 => playground(39), ZN => n_198);
  g27351 : AOI22D0BWP7T port map(A1 => n_251, A2 => playground(76), B1 => n_253, B2 => playground(78), ZN => n_197);
  g27352 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(105), B1 => n_254, B2 => playground(107), ZN => n_196);
  g27358 : AOI33D0BWP7T port map(A1 => n_101, A2 => n_106, A3 => bomb_b_enable, B1 => n_125, B2 => n_95, B3 => bomb_a_enable, ZN => n_195);
  g27359 : AN4D1BWP7T port map(A1 => n_139, A2 => n_12, A3 => n_5, A4 => bomb_f_enable, Z => n_194);
  g27360 : ND4D0BWP7T port map(A1 => n_131, A2 => n_11, A3 => n_10, A4 => bomb_g_enable, ZN => n_193);
  g27306 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(65), B1 => n_251, B2 => playground(69), ZN => n_192);
  g27275 : AOI22D0BWP7T port map(A1 => n_254, A2 => playground(131), B1 => n_253, B2 => playground(135), ZN => n_191);
  g27237 : MAOI222D1BWP7T port map(A => n_126, B => n_112, C => x_map(1), ZN => n_190);
  g27238 : INVD0BWP7T port map(I => n_263, ZN => n_189);
  g27298 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(73), B1 => n_254, B2 => playground(75), ZN => n_188);
  g27305 : AOI22D0BWP7T port map(A1 => n_251, A2 => playground(77), B1 => n_253, B2 => playground(79), ZN => n_187);
  g27257 : AOI22D0BWP7T port map(A1 => n_251, A2 => playground(140), B1 => n_253, B2 => playground(142), ZN => n_186);
  g27258 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(128), B1 => n_251, B2 => playground(132), ZN => n_185);
  g27259 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(97), B1 => n_251, B2 => playground(101), ZN => n_184);
  g27260 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(136), B1 => n_254, B2 => playground(138), ZN => n_183);
  g27261 : AOI22D0BWP7T port map(A1 => n_251, A2 => playground(189), B1 => n_253, B2 => playground(191), ZN => n_182);
  g27262 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(185), B1 => n_254, B2 => playground(187), ZN => n_181);
  g27263 : AOI22D0BWP7T port map(A1 => n_254, A2 => playground(179), B1 => n_253, B2 => playground(183), ZN => n_180);
  g27264 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(177), B1 => n_251, B2 => playground(181), ZN => n_179);
  g27265 : AOI22D0BWP7T port map(A1 => n_251, A2 => playground(173), B1 => n_253, B2 => playground(175), ZN => n_178);
  g27266 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(169), B1 => n_254, B2 => playground(171), ZN => n_177);
  g27267 : AOI22D0BWP7T port map(A1 => n_254, A2 => playground(163), B1 => n_253, B2 => playground(167), ZN => n_176);
  g27268 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(161), B1 => n_251, B2 => playground(165), ZN => n_175);
  g27269 : AOI22D0BWP7T port map(A1 => n_251, A2 => playground(157), B1 => n_253, B2 => playground(159), ZN => n_174);
  g27270 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(153), B1 => n_254, B2 => playground(155), ZN => n_173);
  g27271 : AOI22D0BWP7T port map(A1 => n_254, A2 => playground(147), B1 => n_253, B2 => playground(151), ZN => n_172);
  g27272 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(145), B1 => n_251, B2 => playground(149), ZN => n_171);
  g27273 : AOI22D0BWP7T port map(A1 => n_251, A2 => playground(141), B1 => n_253, B2 => playground(143), ZN => n_170);
  g27274 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(137), B1 => n_254, B2 => playground(139), ZN => n_169);
  g27234 : AO211D0BWP7T port map(A1 => n_109, A2 => n_145, B => n_143, C => n_260, Z => n_168);
  g27276 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(129), B1 => n_251, B2 => playground(133), ZN => n_167);
  g27277 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(64), B1 => n_251, B2 => playground(68), ZN => n_166);
  g27278 : AO22D0BWP7T port map(A1 => n_254, A2 => playground(90), B1 => playground(94), B2 => n_253, Z => n_165);
  g27279 : AO22D0BWP7T port map(A1 => n_254, A2 => playground(218), B1 => playground(222), B2 => n_253, Z => n_164);
  g27280 : AOI22D0BWP7T port map(A1 => n_254, A2 => playground(162), B1 => n_253, B2 => playground(166), ZN => n_163);
  g27281 : AOI22D0BWP7T port map(A1 => n_251, A2 => playground(125), B1 => n_253, B2 => playground(127), ZN => n_162);
  g27282 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(121), B1 => n_254, B2 => playground(123), ZN => n_161);
  g27283 : AOI22D0BWP7T port map(A1 => n_251, A2 => playground(188), B1 => n_253, B2 => playground(190), ZN => n_160);
  g27284 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(184), B1 => n_254, B2 => playground(186), ZN => n_159);
  g27285 : AOI22D0BWP7T port map(A1 => n_254, A2 => playground(115), B1 => n_253, B2 => playground(119), ZN => n_158);
  g27286 : AOI22D0BWP7T port map(A1 => n_254, A2 => playground(178), B1 => n_253, B2 => playground(182), ZN => n_157);
  g27287 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(176), B1 => n_251, B2 => playground(180), ZN => n_156);
  g27288 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(113), B1 => n_251, B2 => playground(117), ZN => n_155);
  g27289 : AOI22D0BWP7T port map(A1 => n_251, A2 => playground(172), B1 => n_253, B2 => playground(174), ZN => n_154);
  g27290 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(168), B1 => n_254, B2 => playground(170), ZN => n_153);
  g27291 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(160), B1 => n_251, B2 => playground(164), ZN => n_152);
  g27292 : AOI22D0BWP7T port map(A1 => n_251, A2 => playground(109), B1 => n_253, B2 => playground(111), ZN => n_151);
  g27293 : AOI22D0BWP7T port map(A1 => n_251, A2 => playground(156), B1 => n_253, B2 => playground(158), ZN => n_150);
  g27294 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(152), B1 => n_254, B2 => playground(154), ZN => n_149);
  g27295 : AOI22D0BWP7T port map(A1 => n_254, A2 => playground(99), B1 => n_253, B2 => playground(103), ZN => n_148);
  g27296 : AOI22D0BWP7T port map(A1 => n_254, A2 => playground(146), B1 => n_253, B2 => playground(150), ZN => n_147);
  g27297 : AOI22D0BWP7T port map(A1 => n_249, A2 => playground(144), B1 => n_251, B2 => playground(148), ZN => n_146);
  g27253 : INVD0BWP7T port map(I => n_388, ZN => n_399);
  g27373 : ND4D0BWP7T port map(A1 => n_128, A2 => n_69, A3 => n_34, A4 => n_1, ZN => n_565);
  g27372 : ND4D0BWP7T port map(A1 => n_129, A2 => n_56, A3 => n_44, A4 => n_26, ZN => n_562);
  g27304 : NR2D1BWP7T port map(A1 => n_463, A2 => n_306, ZN => n_389);
  g27301 : ND2D1BWP7T port map(A1 => n_463, A2 => n_306, ZN => n_420);
  g27254 : INVD1BWP7T port map(I => n_414, ZN => n_412);
  g27236 : MAOI22D0BWP7T port map(A1 => n_144, A2 => n_145, B1 => n_144, B2 => n_145, ZN => n_261);
  g27244 : NR2XD0BWP7T port map(A1 => n_143, A2 => n_113, ZN => n_263);
  g27303 : ND2D1BWP7T port map(A1 => n_392, A2 => n_306, ZN => n_414);
  g27302 : NR2D1BWP7T port map(A1 => n_392, A2 => n_306, ZN => n_388);
  g27353 : INVD1BWP7T port map(I => n_392, ZN => n_463);
  g27363 : INVD0BWP7T port map(I => n_253, ZN => n_142);
  g27362 : INVD0BWP7T port map(I => n_249, ZN => n_295);
  g27355 : FA1D0BWP7T port map(A => n_13, B => input_v_map(3), CI => n_91, CO => n_141, S => n_392);
  g27377 : INVD0BWP7T port map(I => n_276, ZN => n_140);
  g27382 : NR4D0BWP7T port map(A1 => n_121, A2 => n_8, A3 => n_76, A4 => n_43, ZN => n_139);
  g27380 : NR4D0BWP7T port map(A1 => n_104, A2 => n_118, A3 => n_9, A4 => n_14, ZN => n_138);
  g27379 : NR4D0BWP7T port map(A1 => n_117, A2 => n_103, A3 => n_67, A4 => n_66, ZN => n_137);
  g27361 : INVD0BWP7T port map(I => n_251, ZN => n_294);
  g27374 : MOAI22D0BWP7T port map(A1 => n_135, A2 => n_136, B1 => n_135, B2 => n_136, ZN => n_278);
  g27366 : NR2XD0BWP7T port map(A1 => n_134, A2 => n_133, ZN => n_249);
  g27367 : AN2D1BWP7T port map(A1 => n_134, A2 => n_133, Z => n_253);
  g27378 : NR3D0BWP7T port map(A1 => n_102, A2 => n_105, A3 => n_53, ZN => n_132);
  g27385 : NR4D0BWP7T port map(A1 => n_108, A2 => n_15, A3 => n_80, A4 => n_51, ZN => n_131);
  g27386 : NR4D0BWP7T port map(A1 => n_107, A2 => n_18, A3 => n_54, A4 => n_48, ZN => n_130);
  g27388 : NR4D0BWP7T port map(A1 => n_99, A2 => n_55, A3 => n_47, A4 => n_46, ZN => n_129);
  g27384 : NR4D0BWP7T port map(A1 => n_100, A2 => n_23, A3 => n_75, A4 => n_81, ZN => n_128);
  g27364 : INVD0BWP7T port map(I => n_254, ZN => n_127);
  g27252 : INVD0BWP7T port map(I => n_144, ZN => n_126);
  g27383 : NR4D0BWP7T port map(A1 => n_116, A2 => n_7, A3 => n_60, A4 => n_59, ZN => n_125);
  g27299 : NR2D0BWP7T port map(A1 => n_124, A2 => n_145, ZN => n_143);
  g27256 : HA1D0BWP7T port map(A => n_98, B => n_262, CO => n_123, S => n_144);
  g27365 : NR2XD0BWP7T port map(A1 => n_122, A2 => n_133, ZN => n_251);
  g27381 : ND2D1BWP7T port map(A1 => n_119, A2 => n_92, ZN => n_276);
  g27368 : AN2D1BWP7T port map(A1 => n_122, A2 => n_133, Z => n_254);
  g27354 : CKND1BWP7T port map(I => n_481, ZN => n_124);
  g27376 : INVD0BWP7T port map(I => n_122, ZN => n_134);
  g27399 : ND3D0BWP7T port map(A1 => n_68, A2 => n_42, A3 => n_28, ZN => n_121);
  g27391 : MAOI222D1BWP7T port map(A => n_115, B => input_v_map(4), C => input_v_map(2), ZN => n_120);
  g27389 : OAI21D0BWP7T port map(A1 => n_145, A2 => y_map(0), B => x_map(1), ZN => n_119);
  g27396 : ND3D0BWP7T port map(A1 => n_50, A2 => n_22, A3 => n_29, ZN => n_118);
  g27397 : ND3D0BWP7T port map(A1 => n_74, A2 => n_41, A3 => n_40, ZN => n_117);
  g27398 : ND3D0BWP7T port map(A1 => n_71, A2 => n_21, A3 => n_27, ZN => n_116);
  g27392 : MOAI22D0BWP7T port map(A1 => n_115, A2 => n_114, B1 => n_115, B2 => n_114, ZN => n_135);
  g27356 : AN2D1BWP7T port map(A1 => n_113, A2 => n_112, Z => n_260);
  g27394 : MAOI22D0BWP7T port map(A1 => n_111, A2 => n_110, B1 => n_111, B2 => n_110, ZN => n_122);
  g27357 : NR2XD0BWP7T port map(A1 => n_113, A2 => n_109, ZN => n_481);
  g27400 : ND3D0BWP7T port map(A1 => n_24, A2 => n_63, A3 => n_30, ZN => n_108);
  g27401 : ND3D0BWP7T port map(A1 => n_72, A2 => n_61, A3 => n_19, ZN => n_107);
  g27403 : NR4D0BWP7T port map(A1 => n_58, A2 => n_52, A3 => n_83, A4 => n_38, ZN => n_106);
  g27404 : ND4D0BWP7T port map(A1 => n_35, A2 => n_64, A3 => n_31, A4 => bomb_e_enable, ZN => n_105);
  g27405 : ND4D0BWP7T port map(A1 => n_62, A2 => n_36, A3 => n_85, A4 => bomb_d_enable, ZN => n_104);
  g27406 : ND4D0BWP7T port map(A1 => n_77, A2 => n_33, A3 => n_78, A4 => bomb_h_enable, ZN => n_103);
  g27407 : ND4D0BWP7T port map(A1 => n_73, A2 => n_89, A3 => n_25, A4 => n_32, ZN => n_102);
  g27408 : NR4D0BWP7T port map(A1 => n_57, A2 => n_70, A3 => n_37, A4 => n_45, ZN => n_101);
  g27409 : OAI211D0BWP7T port map(A1 => x_p2(0), A2 => n_84, B => n_20, C => n_17, ZN => n_100);
  g27413 : OAI211D0BWP7T port map(A1 => x_p1(2), A2 => n_98, B => n_87, C => n_2, ZN => n_99);
  g27387 : FA1D0BWP7T port map(A => input_v_map(3), B => input_h_map(3), CI => input_v_map(4), CO => n_269, S => n_97);
  g27402 : IND2D1BWP7T port map(A1 => n_111, B1 => n_110, ZN => n_266);
  g27375 : INVD0BWP7T port map(I => n_262, ZN => n_96);
  g27412 : NR2D0BWP7T port map(A1 => n_4, A2 => n_6, ZN => n_95);
  g27393 : MAOI22D0BWP7T port map(A1 => n_93, A2 => input_v_map(3), B1 => n_93, B2 => input_v_map(3), ZN => n_94);
  g27371 : AOI21D0BWP7T port map(A1 => n_92, A2 => n_79, B => n_49, ZN => n_113);
  g27410 : INVD1BWP7T port map(I => n_145, ZN => n_112);
  g27454 : OAI21D0BWP7T port map(A1 => n_88, A2 => x_map(0), B => n_110, ZN => n_133);
  g27395 : MOAI22D0BWP7T port map(A1 => n_92, A2 => y_map(2), B1 => n_92, B2 => y_map(2), ZN => n_262);
  g27411 : HA1D0BWP7T port map(A => input_h_map(2), B => input_v_map(2), CO => n_90, S => n_91);
  g27439 : MAOI22D0BWP7T port map(A1 => n_88, A2 => y_bomb_e(0), B1 => n_88, B2 => y_bomb_e(0), ZN => n_89);
  g27434 : MAOI22D0BWP7T port map(A1 => n_86, A2 => x_p1(3), B1 => n_86, B2 => x_p1(3), ZN => n_87);
  g27484 : MAOI22D0BWP7T port map(A1 => n_84, A2 => x_bomb_d(0), B1 => n_84, B2 => x_bomb_d(0), ZN => n_85);
  g27462 : MOAI22D0BWP7T port map(A1 => n_82, A2 => y_bomb_b(1), B1 => n_82, B2 => y_bomb_b(1), ZN => n_83);
  g27467 : MOAI22D0BWP7T port map(A1 => n_82, A2 => y_p2(1), B1 => n_82, B2 => y_p2(1), ZN => n_81);
  g27464 : MOAI22D0BWP7T port map(A1 => n_79, A2 => y_bomb_g(2), B1 => n_79, B2 => y_bomb_g(2), ZN => n_80);
  g27414 : MAOI22D0BWP7T port map(A1 => n_82, A2 => y_bomb_h(1), B1 => n_82, B2 => y_bomb_h(1), ZN => n_78);
  g27415 : MAOI22D0BWP7T port map(A1 => n_79, A2 => y_bomb_h(2), B1 => n_79, B2 => y_bomb_h(2), ZN => n_77);
  g27416 : MOAI22D0BWP7T port map(A1 => n_88, A2 => y_bomb_f(0), B1 => n_88, B2 => y_bomb_f(0), ZN => n_76);
  g27417 : MOAI22D0BWP7T port map(A1 => n_88, A2 => y_p2(0), B1 => n_88, B2 => y_p2(0), ZN => n_75);
  g27429 : MAOI22D0BWP7T port map(A1 => n_86, A2 => x_bomb_h(3), B1 => n_86, B2 => x_bomb_h(3), ZN => n_74);
  g27430 : MAOI22D0BWP7T port map(A1 => n_86, A2 => x_bomb_e(3), B1 => n_86, B2 => x_bomb_e(3), ZN => n_73);
  g27431 : MAOI22D0BWP7T port map(A1 => n_86, A2 => x_bomb_c(3), B1 => n_86, B2 => x_bomb_c(3), ZN => n_72);
  g27432 : MAOI22D0BWP7T port map(A1 => n_86, A2 => x_bomb_a(3), B1 => n_86, B2 => x_bomb_a(3), ZN => n_71);
  g27433 : MOAI22D0BWP7T port map(A1 => n_86, A2 => x_bomb_b(3), B1 => n_86, B2 => x_bomb_b(3), ZN => n_70);
  g27435 : MAOI22D0BWP7T port map(A1 => n_86, A2 => x_p2(3), B1 => n_86, B2 => x_p2(3), ZN => n_69);
  g27436 : MAOI22D0BWP7T port map(A1 => n_86, A2 => x_bomb_f(3), B1 => n_86, B2 => x_bomb_f(3), ZN => n_68);
  g27438 : MOAI22D0BWP7T port map(A1 => n_88, A2 => y_bomb_h(0), B1 => n_88, B2 => y_bomb_h(0), ZN => n_67);
  g27437 : MOAI22D0BWP7T port map(A1 => n_65, A2 => x_bomb_h(1), B1 => n_65, B2 => x_bomb_h(1), ZN => n_66);
  g27440 : MAOI22D0BWP7T port map(A1 => n_65, A2 => x_bomb_e(1), B1 => n_65, B2 => x_bomb_e(1), ZN => n_64);
  g27441 : MAOI22D0BWP7T port map(A1 => n_65, A2 => x_bomb_g(1), B1 => n_65, B2 => x_bomb_g(1), ZN => n_63);
  g27442 : MAOI22D0BWP7T port map(A1 => n_65, A2 => x_bomb_d(1), B1 => n_65, B2 => x_bomb_d(1), ZN => n_62);
  g27444 : MAOI22D0BWP7T port map(A1 => n_88, A2 => y_bomb_c(0), B1 => n_88, B2 => y_bomb_c(0), ZN => n_61);
  g27445 : MOAI22D0BWP7T port map(A1 => n_65, A2 => x_bomb_a(1), B1 => n_65, B2 => x_bomb_a(1), ZN => n_60);
  g27446 : MOAI22D0BWP7T port map(A1 => n_88, A2 => y_bomb_a(0), B1 => n_88, B2 => y_bomb_a(0), ZN => n_59);
  g27447 : MOAI22D0BWP7T port map(A1 => n_88, A2 => y_bomb_b(0), B1 => n_88, B2 => y_bomb_b(0), ZN => n_58);
  g27448 : MOAI22D0BWP7T port map(A1 => n_65, A2 => x_bomb_b(1), B1 => n_65, B2 => x_bomb_b(1), ZN => n_57);
  g27449 : MAOI22D0BWP7T port map(A1 => n_88, A2 => y_p1(0), B1 => n_88, B2 => y_p1(0), ZN => n_56);
  g27450 : MOAI22D0BWP7T port map(A1 => n_65, A2 => x_p1(1), B1 => n_65, B2 => x_p1(1), ZN => n_55);
  g27460 : MOAI22D0BWP7T port map(A1 => n_79, A2 => y_bomb_c(2), B1 => n_79, B2 => y_bomb_c(2), ZN => n_54);
  g27456 : MOAI22D0BWP7T port map(A1 => n_82, A2 => y_bomb_e(1), B1 => n_82, B2 => y_bomb_e(1), ZN => n_53);
  g27463 : MOAI22D0BWP7T port map(A1 => n_79, A2 => y_bomb_b(2), B1 => n_79, B2 => y_bomb_b(2), ZN => n_52);
  g27457 : MOAI22D0BWP7T port map(A1 => n_82, A2 => y_bomb_g(1), B1 => n_82, B2 => y_bomb_g(1), ZN => n_51);
  g27458 : MAOI22D0BWP7T port map(A1 => n_79, A2 => y_bomb_d(2), B1 => n_79, B2 => y_bomb_d(2), ZN => n_50);
  g27390 : AN3D0BWP7T port map(A1 => n_92, A2 => n_79, A3 => n_49, Z => n_109);
  g27455 : OAI21D0BWP7T port map(A1 => y_map(0), A2 => y_map(1), B => n_92, ZN => n_145);
  g27486 : MOAI22D0BWP7T port map(A1 => n_84, A2 => x_bomb_c(0), B1 => n_84, B2 => x_bomb_c(0), ZN => n_48);
  g27466 : MOAI22D0BWP7T port map(A1 => n_82, A2 => y_p1(1), B1 => n_82, B2 => y_p1(1), ZN => n_47);
  g27485 : MOAI22D0BWP7T port map(A1 => n_84, A2 => x_p1(0), B1 => n_84, B2 => x_p1(0), ZN => n_46);
  g27489 : MOAI22D0BWP7T port map(A1 => n_84, A2 => x_bomb_b(0), B1 => n_84, B2 => x_bomb_b(0), ZN => n_45);
  g27465 : MAOI22D0BWP7T port map(A1 => n_79, A2 => y_p1(2), B1 => n_79, B2 => y_p1(2), ZN => n_44);
  g27469 : MOAI22D0BWP7T port map(A1 => n_82, A2 => y_bomb_f(1), B1 => n_82, B2 => y_bomb_f(1), ZN => n_43);
  g27470 : MAOI22D0BWP7T port map(A1 => n_79, A2 => y_bomb_f(2), B1 => n_79, B2 => y_bomb_f(2), ZN => n_42);
  g27471 : MAOI22D0BWP7T port map(A1 => n_98, A2 => x_bomb_h(2), B1 => n_98, B2 => x_bomb_h(2), ZN => n_41);
  g27480 : MAOI22D0BWP7T port map(A1 => n_84, A2 => x_bomb_h(0), B1 => n_84, B2 => x_bomb_h(0), ZN => n_40);
  g27474 : MAOI22D0BWP7T port map(A1 => n_98, A2 => x_bomb_c(2), B1 => n_98, B2 => x_bomb_c(2), ZN => n_39);
  g27488 : MOAI22D0BWP7T port map(A1 => n_49, A2 => y_bomb_b(3), B1 => n_49, B2 => y_bomb_b(3), ZN => n_38);
  g27476 : MOAI22D0BWP7T port map(A1 => n_98, A2 => x_bomb_b(2), B1 => n_98, B2 => x_bomb_b(2), ZN => n_37);
  g27477 : MAOI22D0BWP7T port map(A1 => n_98, A2 => x_bomb_d(2), B1 => n_98, B2 => x_bomb_d(2), ZN => n_36);
  g27472 : MAOI22D0BWP7T port map(A1 => n_98, A2 => x_bomb_e(2), B1 => n_98, B2 => x_bomb_e(2), ZN => n_35);
  g27478 : MAOI22D0BWP7T port map(A1 => n_98, A2 => x_p2(2), B1 => n_98, B2 => x_p2(2), ZN => n_34);
  g27479 : MAOI22D0BWP7T port map(A1 => n_49, A2 => y_bomb_h(3), B1 => n_49, B2 => y_bomb_h(3), ZN => n_33);
  g27481 : MAOI22D0BWP7T port map(A1 => n_49, A2 => y_bomb_e(3), B1 => n_49, B2 => y_bomb_e(3), ZN => n_32);
  g27482 : MAOI22D0BWP7T port map(A1 => n_84, A2 => x_bomb_e(0), B1 => n_84, B2 => x_bomb_e(0), ZN => n_31);
  g27483 : MAOI22D0BWP7T port map(A1 => n_84, A2 => x_bomb_g(0), B1 => n_84, B2 => x_bomb_g(0), ZN => n_30);
  g27490 : MAOI22D0BWP7T port map(A1 => n_49, A2 => y_bomb_d(3), B1 => n_49, B2 => y_bomb_d(3), ZN => n_29);
  g27491 : MAOI22D0BWP7T port map(A1 => n_49, A2 => y_bomb_f(3), B1 => n_49, B2 => y_bomb_f(3), ZN => n_28);
  g27492 : MAOI22D0BWP7T port map(A1 => n_84, A2 => x_bomb_a(0), B1 => n_84, B2 => x_bomb_a(0), ZN => n_27);
  g27493 : MAOI22D0BWP7T port map(A1 => n_49, A2 => y_p1(3), B1 => n_49, B2 => y_p1(3), ZN => n_26);
  g27495 : MAOI22D0BWP7T port map(A1 => n_79, A2 => y_bomb_e(2), B1 => n_79, B2 => y_bomb_e(2), ZN => n_25);
  g27473 : MAOI22D0BWP7T port map(A1 => n_98, A2 => x_bomb_g(2), B1 => n_98, B2 => x_bomb_g(2), ZN => n_24);
  g27451 : MOAI22D0BWP7T port map(A1 => n_65, A2 => x_p2(1), B1 => n_65, B2 => x_p2(1), ZN => n_23);
  g27459 : MAOI22D0BWP7T port map(A1 => n_82, A2 => y_bomb_d(1), B1 => n_82, B2 => y_bomb_d(1), ZN => n_22);
  g27475 : MAOI22D0BWP7T port map(A1 => n_98, A2 => x_bomb_a(2), B1 => n_98, B2 => x_bomb_a(2), ZN => n_21);
  g27468 : MAOI22D0BWP7T port map(A1 => n_79, A2 => y_p2(2), B1 => n_79, B2 => y_p2(2), ZN => n_20);
  g27487 : MAOI22D0BWP7T port map(A1 => n_49, A2 => y_bomb_c(3), B1 => n_49, B2 => y_bomb_c(3), ZN => n_19);
  g27461 : MOAI22D0BWP7T port map(A1 => n_82, A2 => y_bomb_c(1), B1 => n_82, B2 => y_bomb_c(1), ZN => n_18);
  g27494 : MAOI22D0BWP7T port map(A1 => n_49, A2 => y_p2(3), B1 => n_49, B2 => y_p2(3), ZN => n_17);
  g27443 : MAOI22D0BWP7T port map(A1 => n_65, A2 => x_bomb_c(1), B1 => n_65, B2 => x_bomb_c(1), ZN => n_16);
  g27496 : AOI22D0BWP7T port map(A1 => n_82, A2 => n_65, B1 => y_map(1), B2 => x_map(1), ZN => n_111);
  g27452 : IOA21D1BWP7T port map(A1 => n_0, A2 => input_h_map(4), B => n_93, ZN => n_115);
  g27497 : MAOI22D0BWP7T port map(A1 => n_114, A2 => input_h_map(1), B1 => n_114, B2 => input_h_map(1), ZN => n_306);
  g27420 : MAOI22D0BWP7T port map(A1 => y_map(0), A2 => y_bomb_g(0), B1 => y_map(0), B2 => y_bomb_g(0), ZN => n_15);
  g27424 : MAOI22D0BWP7T port map(A1 => y_map(0), A2 => y_bomb_d(0), B1 => y_map(0), B2 => y_bomb_d(0), ZN => n_14);
  g27500 : INR2XD0BWP7T port map(A1 => input_h_map(1), B1 => n_114, ZN => n_13);
  g27427 : MOAI22D0BWP7T port map(A1 => x_map(1), A2 => x_bomb_f(1), B1 => x_map(1), B2 => x_bomb_f(1), ZN => n_12);
  g27418 : MOAI22D0BWP7T port map(A1 => x_map(3), A2 => x_bomb_g(3), B1 => x_map(3), B2 => x_bomb_g(3), ZN => n_11);
  g27419 : MOAI22D0BWP7T port map(A1 => y_map(3), A2 => y_bomb_g(3), B1 => y_map(3), B2 => y_bomb_g(3), ZN => n_10);
  g27425 : MAOI22D0BWP7T port map(A1 => x_map(3), A2 => x_bomb_d(3), B1 => x_map(3), B2 => x_bomb_d(3), ZN => n_9);
  g27503 : ND2D1BWP7T port map(A1 => n_88, A2 => x_map(0), ZN => n_110);
  g27428 : MAOI22D0BWP7T port map(A1 => x_map(0), A2 => x_bomb_f(0), B1 => x_map(0), B2 => x_bomb_f(0), ZN => n_8);
  g27423 : MAOI22D0BWP7T port map(A1 => y_map(2), A2 => y_bomb_a(2), B1 => y_map(2), B2 => y_bomb_a(2), ZN => n_7);
  g27421 : MAOI22D0BWP7T port map(A1 => y_map(3), A2 => y_bomb_a(3), B1 => y_map(3), B2 => y_bomb_a(3), ZN => n_6);
  g27426 : MOAI22D0BWP7T port map(A1 => x_map(2), A2 => x_bomb_f(2), B1 => x_map(2), B2 => x_bomb_f(2), ZN => n_5);
  g27422 : MAOI22D0BWP7T port map(A1 => y_map(1), A2 => y_bomb_a(1), B1 => y_map(1), B2 => y_bomb_a(1), ZN => n_4);
  g27453 : OAI21D0BWP7T port map(A1 => input_v_map(3), A2 => input_h_map(4), B => input_v_map(5), ZN => n_3);
  g27498 : CKND2D0BWP7T port map(A1 => n_98, A2 => x_p1(2), ZN => n_2);
  g27501 : CKND2D0BWP7T port map(A1 => n_84, A2 => x_p2(0), ZN => n_1);
  g27504 : ND2D1BWP7T port map(A1 => y_map(0), A2 => y_map(1), ZN => n_92);
  g27502 : NR2D1BWP7T port map(A1 => reset, A2 => victory, ZN => n_571);
  g27499 : IND2D1BWP7T port map(A1 => input_h_map(4), B1 => input_v_map(5), ZN => n_93);
  g27510 : INVD0BWP7T port map(I => input_v_map(5), ZN => n_0);
  g27515 : INVD1BWP7T port map(I => x_map(3), ZN => n_86);
  g27514 : INVD1BWP7T port map(I => y_map(0), ZN => n_88);
  g27506 : INVD1BWP7T port map(I => x_map(2), ZN => n_98);
  g27509 : INVD1BWP7T port map(I => x_map(1), ZN => n_65);
  g27505 : INVD1BWP7T port map(I => input_v_map(4), ZN => n_136);
  g27511 : INVD1BWP7T port map(I => input_v_map(2), ZN => n_114);
  g27513 : INVD1BWP7T port map(I => x_map(0), ZN => n_84);
  g27512 : INVD1BWP7T port map(I => y_map(3), ZN => n_49);
  g27507 : INVD1BWP7T port map(I => y_map(1), ZN => n_82);
  g27508 : INVD1BWP7T port map(I => y_map(2), ZN => n_79);
  g2 : IOA21D1BWP7T port map(A1 => n_384, A2 => n_491, B => n_405, ZN => n_931);

end synthesised;
