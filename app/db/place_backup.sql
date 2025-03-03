PGDMP      )                }            ch_piacenza    16.3 (Debian 16.3-1.pgdg110+1)    16.4 W               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    36614    ch_piacenza    DATABASE     v   CREATE DATABASE ch_piacenza WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE ch_piacenza;
                postgres    false                        3079    36615    fuzzystrmatch 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;
    DROP EXTENSION fuzzystrmatch;
                   false                       0    0    EXTENSION fuzzystrmatch    COMMENT     ]   COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';
                        false    2                        3079    36627    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                   false                       0    0    EXTENSION postgis    COMMENT     ^   COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';
                        false    3            �            1259    37705    attachments    TABLE     e   CREATE TABLE public.attachments (
    "idAttachments" integer NOT NULL,
    "fkStructure" integer
);
    DROP TABLE public.attachments;
       public         heap    postgres    false                       0    0    TABLE attachments    COMMENT     q   COMMENT ON TABLE public.attachments IS 'Entity for any documentation and historical attachments of a structure';
          public          postgres    false    222            �            1259    37708    attachments_idAttachments_seq    SEQUENCE     �   CREATE SEQUENCE public."attachments_idAttachments_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public."attachments_idAttachments_seq";
       public          postgres    false    222                       0    0    attachments_idAttachments_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public."attachments_idAttachments_seq" OWNED BY public.attachments."idAttachments";
          public          postgres    false    223            �            1259    37709    camera    TABLE     8   CREATE TABLE public.camera (
    id integer NOT NULL
);
    DROP TABLE public.camera;
       public         heap    postgres    false            �            1259    37712    camera_id_seq    SEQUENCE     �   CREATE SEQUENCE public.camera_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.camera_id_seq;
       public          postgres    false    224                       0    0    camera_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.camera_id_seq OWNED BY public.camera.id;
          public          postgres    false    225            �            1259    37719    defects    TABLE     �   CREATE TABLE public.defects (
    id integer NOT NULL,
    fkinspections integer,
    type character varying(100),
    x real,
    y real,
    z real,
    severity integer,
    note character varying,
    fkelement integer
);
    DROP TABLE public.defects;
       public         heap    postgres    false                       0    0    TABLE defects    COMMENT     w   COMMENT ON TABLE public.defects IS 'Defects and deterioration documented during the inspection of a given structure.';
          public          postgres    false    226            �            1259    37724    defects_id_seq    SEQUENCE     �   CREATE SEQUENCE public.defects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.defects_id_seq;
       public          postgres    false    226                       0    0    defects_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.defects_id_seq OWNED BY public.defects.id;
          public          postgres    false    227            �            1259    37725    inspections    TABLE     �   CREATE TABLE public.inspections (
    fkstructure integer NOT NULL,
    date date,
    note character varying(200),
    technician character varying,
    id integer NOT NULL
);
    DROP TABLE public.inspections;
       public         heap    postgres    false                       0    0    TABLE inspections    COMMENT     k   COMMENT ON TABLE public.inspections IS 'Inspection documentation executed periodically on the structure.';
          public          postgres    false    228            �            1259    37730    inspections_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inspections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.inspections_id_seq;
       public          postgres    false    228                       0    0    inspections_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.inspections_id_seq OWNED BY public.inspections.id;
          public          postgres    false    229            �            1259    37731    oriented_images    TABLE     q   CREATE TABLE public.oriented_images (
    fkinspection integer,
    fkcamera integer,
    id integer NOT NULL
);
 #   DROP TABLE public.oriented_images;
       public         heap    postgres    false                       0    0    TABLE oriented_images    COMMENT     �   COMMENT ON TABLE public.oriented_images IS 'Images collected with camera on field and oriented with a photogrammetric process';
          public          postgres    false    230            �            1259    37734    oriented_images_id_seq    SEQUENCE     �   CREATE SEQUENCE public.oriented_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.oriented_images_id_seq;
       public          postgres    false    230                       0    0    oriented_images_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.oriented_images_id_seq OWNED BY public.oriented_images.id;
          public          postgres    false    231            �            1259    37735    pointclouds    TABLE     w   CREATE TABLE public.pointclouds (
    fkinspection integer,
    filepath character varying,
    id integer NOT NULL
);
    DROP TABLE public.pointclouds;
       public         heap    postgres    false                       0    0    TABLE pointclouds    COMMENT     a   COMMENT ON TABLE public.pointclouds IS 'Information on pointcloud collected during inspections';
          public          postgres    false    232            �            1259    37740    pointclouds_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pointclouds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.pointclouds_id_seq;
       public          postgres    false    232                       0    0    pointclouds_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.pointclouds_id_seq OWNED BY public.pointclouds.id;
          public          postgres    false    233            �            1259    37747    sub_elements    TABLE     �   CREATE TABLE public.sub_elements (
    scalarfield integer,
    id integer NOT NULL,
    name character varying,
    material character varying,
    fkstructure integer
);
     DROP TABLE public.sub_elements;
       public         heap    postgres    false                       0    0    TABLE sub_elements    COMMENT     L   COMMENT ON TABLE public.sub_elements IS 'Relevant elements of a structure';
          public          postgres    false    234            �            1259    37752    structural_elements_id_seq    SEQUENCE     �   CREATE SEQUENCE public.structural_elements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.structural_elements_id_seq;
       public          postgres    false    234                       0    0    structural_elements_id_seq    SEQUENCE OWNED BY     R   ALTER SEQUENCE public.structural_elements_id_seq OWNED BY public.sub_elements.id;
          public          postgres    false    235            �            1259    37753 
   structures    TABLE     �   CREATE TABLE public.structures (
    id integer NOT NULL,
    name character varying,
    geom public.geometry(Point,4326),
    owner character varying,
    est_year integer,
    type character varying
);
    DROP TABLE public.structures;
       public         heap    postgres    false    3    3    3    3    3    3    3    3                       0    0    TABLE structures    COMMENT     g   COMMENT ON TABLE public.structures IS 'Table for storing general information about a built structure';
          public          postgres    false    236            �            1259    37758    structures_id_seq    SEQUENCE     �   CREATE SEQUENCE public.structures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.structures_id_seq;
       public          postgres    false    236                       0    0    structures_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.structures_id_seq OWNED BY public.structures.id;
          public          postgres    false    237            8           2604    37759    attachments idAttachments    DEFAULT     �   ALTER TABLE ONLY public.attachments ALTER COLUMN "idAttachments" SET DEFAULT nextval('public."attachments_idAttachments_seq"'::regclass);
 J   ALTER TABLE public.attachments ALTER COLUMN "idAttachments" DROP DEFAULT;
       public          postgres    false    223    222            9           2604    37760 	   camera id    DEFAULT     f   ALTER TABLE ONLY public.camera ALTER COLUMN id SET DEFAULT nextval('public.camera_id_seq'::regclass);
 8   ALTER TABLE public.camera ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224            :           2604    37762 
   defects id    DEFAULT     h   ALTER TABLE ONLY public.defects ALTER COLUMN id SET DEFAULT nextval('public.defects_id_seq'::regclass);
 9   ALTER TABLE public.defects ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226            ;           2604    37763    inspections id    DEFAULT     p   ALTER TABLE ONLY public.inspections ALTER COLUMN id SET DEFAULT nextval('public.inspections_id_seq'::regclass);
 =   ALTER TABLE public.inspections ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228            <           2604    37764    oriented_images id    DEFAULT     x   ALTER TABLE ONLY public.oriented_images ALTER COLUMN id SET DEFAULT nextval('public.oriented_images_id_seq'::regclass);
 A   ALTER TABLE public.oriented_images ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230            =           2604    37765    pointclouds id    DEFAULT     p   ALTER TABLE ONLY public.pointclouds ALTER COLUMN id SET DEFAULT nextval('public.pointclouds_id_seq'::regclass);
 =   ALTER TABLE public.pointclouds ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232            ?           2604    37768    structures id    DEFAULT     n   ALTER TABLE ONLY public.structures ALTER COLUMN id SET DEFAULT nextval('public.structures_id_seq'::regclass);
 <   ALTER TABLE public.structures ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236            >           2604    37767    sub_elements id    DEFAULT     y   ALTER TABLE ONLY public.sub_elements ALTER COLUMN id SET DEFAULT nextval('public.structural_elements_id_seq'::regclass);
 >   ALTER TABLE public.sub_elements ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    234            �          0    37705    attachments 
   TABLE DATA           E   COPY public.attachments ("idAttachments", "fkStructure") FROM stdin;
    public          postgres    false    222   �a       �          0    37709    camera 
   TABLE DATA           $   COPY public.camera (id) FROM stdin;
    public          postgres    false    224   �a       �          0    37719    defects 
   TABLE DATA           ^   COPY public.defects (id, fkinspections, type, x, y, z, severity, note, fkelement) FROM stdin;
    public          postgres    false    226   �a       �          0    37725    inspections 
   TABLE DATA           N   COPY public.inspections (fkstructure, date, note, technician, id) FROM stdin;
    public          postgres    false    228   	b       �          0    37731    oriented_images 
   TABLE DATA           E   COPY public.oriented_images (fkinspection, fkcamera, id) FROM stdin;
    public          postgres    false    230   &b                  0    37735    pointclouds 
   TABLE DATA           A   COPY public.pointclouds (fkinspection, filepath, id) FROM stdin;
    public          postgres    false    232   Cb       7          0    36945    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public          postgres    false    218   `b                 0    37753 
   structures 
   TABLE DATA           K   COPY public.structures (id, name, geom, owner, est_year, type) FROM stdin;
    public          postgres    false    236   }b                 0    37747    sub_elements 
   TABLE DATA           T   COPY public.sub_elements (scalarfield, id, name, material, fkstructure) FROM stdin;
    public          postgres    false    234   �b                  0    0    attachments_idAttachments_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."attachments_idAttachments_seq"', 1, false);
          public          postgres    false    223                       0    0    camera_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.camera_id_seq', 1, false);
          public          postgres    false    225                       0    0    defects_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.defects_id_seq', 1, false);
          public          postgres    false    227                        0    0    inspections_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.inspections_id_seq', 18, true);
          public          postgres    false    229            !           0    0    oriented_images_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.oriented_images_id_seq', 1, false);
          public          postgres    false    231            "           0    0    pointclouds_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.pointclouds_id_seq', 12, true);
          public          postgres    false    233            #           0    0    structural_elements_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.structural_elements_id_seq', 3, true);
          public          postgres    false    235            $           0    0    structures_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.structures_id_seq', 22, true);
          public          postgres    false    237            D           2606    37772    attachments idAttachments 
   CONSTRAINT     f   ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT "idAttachments" PRIMARY KEY ("idAttachments");
 E   ALTER TABLE ONLY public.attachments DROP CONSTRAINT "idAttachments";
       public            postgres    false    222            F           2606    37774    camera idCamera 
   CONSTRAINT     O   ALTER TABLE ONLY public.camera
    ADD CONSTRAINT "idCamera" PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.camera DROP CONSTRAINT "idCamera";
       public            postgres    false    224            H           2606    37776    defects idDefect 
   CONSTRAINT     P   ALTER TABLE ONLY public.defects
    ADD CONSTRAINT "idDefect" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.defects DROP CONSTRAINT "idDefect";
       public            postgres    false    226            P           2606    37778    sub_elements idElement 
   CONSTRAINT     V   ALTER TABLE ONLY public.sub_elements
    ADD CONSTRAINT "idElement" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.sub_elements DROP CONSTRAINT "idElement";
       public            postgres    false    234            L           2606    37780    oriented_images idImage 
   CONSTRAINT     W   ALTER TABLE ONLY public.oriented_images
    ADD CONSTRAINT "idImage" PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.oriented_images DROP CONSTRAINT "idImage";
       public            postgres    false    230            J           2606    37782    inspections idInspection 
   CONSTRAINT     X   ALTER TABLE ONLY public.inspections
    ADD CONSTRAINT "idInspection" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.inspections DROP CONSTRAINT "idInspection";
       public            postgres    false    228            N           2606    37784    pointclouds idPointcloud 
   CONSTRAINT     X   ALTER TABLE ONLY public.pointclouds
    ADD CONSTRAINT "idPointcloud" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.pointclouds DROP CONSTRAINT "idPointcloud";
       public            postgres    false    232            R           2606    37788    structures idStructure 
   CONSTRAINT     V   ALTER TABLE ONLY public.structures
    ADD CONSTRAINT "idStructure" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.structures DROP CONSTRAINT "idStructure";
       public            postgres    false    236            S           2606    37842    attachments att_struct    FK CONSTRAINT     �   ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT att_struct FOREIGN KEY ("fkStructure") REFERENCES public.structures(id) NOT VALID;
 @   ALTER TABLE ONLY public.attachments DROP CONSTRAINT att_struct;
       public          postgres    false    236    222    4178            T           2606    37847    defects def_el    FK CONSTRAINT     �   ALTER TABLE ONLY public.defects
    ADD CONSTRAINT def_el FOREIGN KEY (fkelement) REFERENCES public.sub_elements(id) NOT VALID;
 8   ALTER TABLE ONLY public.defects DROP CONSTRAINT def_el;
       public          postgres    false    4176    226    234            U           2606    37852    defects def_insp    FK CONSTRAINT     �   ALTER TABLE ONLY public.defects
    ADD CONSTRAINT def_insp FOREIGN KEY (fkinspections) REFERENCES public.inspections(id) NOT VALID;
 :   ALTER TABLE ONLY public.defects DROP CONSTRAINT def_insp;
       public          postgres    false    226    228    4170            Z           2606    37789    oriented_images fkCamera    FK CONSTRAINT     �   ALTER TABLE ONLY public.oriented_images
    ADD CONSTRAINT "fkCamera" FOREIGN KEY (fkcamera) REFERENCES public.camera(id) NOT VALID;
 D   ALTER TABLE ONLY public.oriented_images DROP CONSTRAINT "fkCamera";
       public          postgres    false    224    4166    230            V           2606    37794    defects fkElement    FK CONSTRAINT     �   ALTER TABLE ONLY public.defects
    ADD CONSTRAINT "fkElement" FOREIGN KEY (fkelement) REFERENCES public.sub_elements(id) NOT VALID;
 =   ALTER TABLE ONLY public.defects DROP CONSTRAINT "fkElement";
       public          postgres    false    234    226    4176            W           2606    37804    defects fkInspection    FK CONSTRAINT     �   ALTER TABLE ONLY public.defects
    ADD CONSTRAINT "fkInspection" FOREIGN KEY (fkinspections) REFERENCES public.inspections(id) NOT VALID;
 @   ALTER TABLE ONLY public.defects DROP CONSTRAINT "fkInspection";
       public          postgres    false    226    4170    228            ^           2606    37809    pointclouds fkInspections    FK CONSTRAINT     �   ALTER TABLE ONLY public.pointclouds
    ADD CONSTRAINT "fkInspections" FOREIGN KEY (fkinspection) REFERENCES public.inspections(id) NOT VALID;
 E   ALTER TABLE ONLY public.pointclouds DROP CONSTRAINT "fkInspections";
       public          postgres    false    228    232    4170            [           2606    37814    oriented_images fkInspections    FK CONSTRAINT     �   ALTER TABLE ONLY public.oriented_images
    ADD CONSTRAINT "fkInspections" FOREIGN KEY (fkinspection) REFERENCES public.inspections(id) NOT VALID;
 I   ALTER TABLE ONLY public.oriented_images DROP CONSTRAINT "fkInspections";
       public          postgres    false    228    4170    230            `           2606    37819    sub_elements fkStructure    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_elements
    ADD CONSTRAINT "fkStructure" FOREIGN KEY (fkstructure) REFERENCES public.structures(id) NOT VALID;
 D   ALTER TABLE ONLY public.sub_elements DROP CONSTRAINT "fkStructure";
       public          postgres    false    234    236    4178            X           2606    37824    inspections fkStructure    FK CONSTRAINT     �   ALTER TABLE ONLY public.inspections
    ADD CONSTRAINT "fkStructure" FOREIGN KEY (fkstructure) REFERENCES public.structures(id) NOT VALID;
 C   ALTER TABLE ONLY public.inspections DROP CONSTRAINT "fkStructure";
       public          postgres    false    236    228    4178            Y           2606    37857    inspections insp_struct    FK CONSTRAINT     �   ALTER TABLE ONLY public.inspections
    ADD CONSTRAINT insp_struct FOREIGN KEY (fkstructure) REFERENCES public.structures(id) NOT VALID;
 A   ALTER TABLE ONLY public.inspections DROP CONSTRAINT insp_struct;
       public          postgres    false    236    4178    228            \           2606    37862    oriented_images oi_cam    FK CONSTRAINT     �   ALTER TABLE ONLY public.oriented_images
    ADD CONSTRAINT oi_cam FOREIGN KEY (fkcamera) REFERENCES public.camera(id) NOT VALID;
 @   ALTER TABLE ONLY public.oriented_images DROP CONSTRAINT oi_cam;
       public          postgres    false    4166    230    224            ]           2606    37867    oriented_images oi_insp    FK CONSTRAINT     �   ALTER TABLE ONLY public.oriented_images
    ADD CONSTRAINT oi_insp FOREIGN KEY (fkinspection) REFERENCES public.inspections(id) NOT VALID;
 A   ALTER TABLE ONLY public.oriented_images DROP CONSTRAINT oi_insp;
       public          postgres    false    4170    230    228            _           2606    37872    pointclouds pc_insp    FK CONSTRAINT     �   ALTER TABLE ONLY public.pointclouds
    ADD CONSTRAINT pc_insp FOREIGN KEY (fkinspection) REFERENCES public.inspections(id) NOT VALID;
 =   ALTER TABLE ONLY public.pointclouds DROP CONSTRAINT pc_insp;
       public          postgres    false    232    228    4170            a           2606    37877    sub_elements subel_struct    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_elements
    ADD CONSTRAINT subel_struct FOREIGN KEY (fkstructure) REFERENCES public.structures(id) NOT VALID;
 C   ALTER TABLE ONLY public.sub_elements DROP CONSTRAINT subel_struct;
       public          postgres    false    234    4178    236            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �             x������ � �      7      x������ � �         Z   x�32�t��L-NTHI��IUpJ�KMI-)��K�40B 02p53,-��L��]�̌�M�,�܌\L],,�L�L8c� �+F��� ��            x������ � �     