From: Brian Dodge <bdodge09@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for
 ArcticSand arcxcnn driver bindings
Date: Wed, 26 Jun 2019 10:59:55 -0400
Message-ID: <CAFaGBPmF2gDNEy_Ok_Ky9GR7XEyVUdhG=BYGXEMCN1Tq2eHo6g@mail.gmail.com>
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
 <1561435529-7835-2-git-send-email-bdodge09@gmail.com>
 <20190625085534.xf2ullyju3ewbgik@holly.lan>
 <CAFaGBPnH=75=wJRM4EX9MYR8MSehEa2_hBEOsqo-DZvD6c6f_A@mail.gmail.com>
 <20190626105614.ujmryi7qou2ra7aq@holly.lan>
 <20190626145624.GC22348@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2112663020=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190626145624.GC22348@xo-6d-61-c0.localdomain>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, jingoohan1@gmail.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com, pbacon@psemi.com, lee.jones@linaro.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

--===============2112663020==
Content-Type: multipart/alternative; boundary="00000000000016bf57058c3b4dba"

--00000000000016bf57058c3b4dba
Content-Type: text/plain; charset="UTF-8"

Is there a standard way to format to-be-deprecated items in the bindings?


On Wed, Jun 26, 2019, 10:56 AM Pavel Machek <pavel@ucw.cz> wrote:

> On Wed 2019-06-26 11:56:14, Daniel Thompson wrote:
> > On Tue, Jun 25, 2019 at 07:44:06AM -0400, Brian Dodge wrote:
> > > I would like to deprecate the old prefix in the future after
> communicating
> > > with all chip customers, which is why the old prefix is not documented
> in
> > > the new bindings.
> >
> > Deprecation is fine (by me at least) it's just that I'm not sure that
> > removing the documentation for the deprecated bindings is the right way
> > to do it. What is the prior art here?
>
> I believe we should keep the docs.
>
>                                                                 Pavel
>

--00000000000016bf57058c3b4dba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Is there a standard way to format to-be-deprecated items =
in the bindings?<div dir=3D"auto"><br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 26, 2019, 10:56 AM =
Pavel Machek &lt;<a href=3D"mailto:pavel@ucw.cz">pavel@ucw.cz</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Wed 2019-06-26 11:56:14, Danie=
l Thompson wrote:<br>
&gt; On Tue, Jun 25, 2019 at 07:44:06AM -0400, Brian Dodge wrote:<br>
&gt; &gt; I would like to deprecate the old prefix in the future after comm=
unicating<br>
&gt; &gt; with all chip customers, which is why the old prefix is not docum=
ented in<br>
&gt; &gt; the new bindings.<br>
&gt; <br>
&gt; Deprecation is fine (by me at least) it&#39;s just that I&#39;m not su=
re that<br>
&gt; removing the documentation for the deprecated bindings is the right wa=
y<br>
&gt; to do it. What is the prior art here?<br>
<br>
I believe we should keep the docs.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Pavel<br>
</blockquote></div>

--00000000000016bf57058c3b4dba--

--===============2112663020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2112663020==--
