Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795116248;
	b=YKgMVgKReeS3USniVKvit0CyJe6w2UMNsf6IASHqqK3/4s7cZKVIn6QPBQeLFMRnqYgr
	 o7cQIiC2uP40TCkksd2VlDwI9FCdY9kg238G4jtcn2R74gWBPBs1kv8B128q7s261r3ZC
	 XfeAnaIPdZ49603E1d/THmi0P4s+xJlsMSpeAJwAjsy38H9Ua4JfYGq88KZ5uY4GEiGQp
	 ASXLCUDJpfL2KMMCcJhncR2cu9ifn2vjng/ABA0aPmu4xe5HFxKzdhS4v+YfcpDdihpx+
	 kZzICMe7zTm8Tcjvb1EzhbQy3+VM4bwG0XvN1tFY13q/VlpeSTbHOzH5XdlVggMVZtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=oJ9lQlnrIoDeye4I9sWURdg2kwBBKMsAxkmiWLBweSU=;
	b=LhGYccFhtoBrxUWLKrlWR2+wOpR0pfDU64kmFxo6VUx8mYv9XuzeHj+yahoXcEDqTzh0
	 G7agdpMxzYrGstbl328SODWNuRgvUH8ScXgA/8s1+CDalI1OIYVOTDhmWlYv0X3sH4K/0
	 oEgFwxCZsyt5SFTtfana8SEERIeuXy21v9K+6COPBuuId0ijKS1yJiK1RfKuA8OLinRa3
	 aK5gwyfbm+mXsZg6dFgr+IsI4WsyL+FptYjq5N5SbZZ9RFJkW+bDRz31FCvb3yf5p4m23
	 XWrAijEspQrrKByzg7p3kSTnI353I08pto2CKdfZesTQOy+RE1cn6OAp8YE5ynXHfFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAkZbmnP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F207D606A32F
	for <linux-leds@vger.kernel.org>; Thu, 19 Nov 2026 19:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F207D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAkZbmnP
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ee029fd76aso37189e0c.1
        for <linux-leds@vger.kernel.org>; Thu, 19 Nov 2026 11:24:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795116247; cv=none;
        d=google.com; s=arc-20260327;
        b=RsECosRlk86Gllm/bUCCfDyK4t/mMQcAByxjMvYWkSnxIzMsstS18SmZ+ROaZXlhp4
         L1sZY+1tqtBlMI/pWQR+ZgJezXiPO5FTw+Cm74bbTh/NbFfXQa6gDei4aAeuL7CXlq44
         zL0Snj8OgY/HON0ta7rY19Nf4/dtuFf7+yUg1VN59CaQvK85F8C4i9yL53RyWI8lhOtr
         aoGBZSaef0xT3u7DRr5Ddy+p1ucLpPAPBfk8jc6TM8t6rQgaMUzoRj+l4uscHWxifeWB
         89FnXrZR9HfOZLz3dm2N4ph+v+3vOc1dIAxMJ44tiYsxnQyeGDq0beMIIGK9Wh8ik3Dx
         k9cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oJ9lQlnrIoDeye4I9sWURdg2kwBBKMsAxkmiWLBweSU=;
        fh=epHIpCuMzLFOCYyZfVVIGq+s7c8TOdKTSCG3ycyAZMo=;
        b=qdbwFIJCChk64DyEPUFk8tckGezGjMYOlUDXeUZSz5HHNce3ABo8+3hbPDrozLYBD7
         ReYFX+Y9/m2f7RZLyURzLdePJ5Tjh79cimrnqznjmbW5sa2XYb9t/0JMtg5N/oPdcOa1
         7cntkgB3uokQ+NAtfzs4bJ9fRHxD1fLzlc16K+9bE6kpU3kw8dJZz7+OR+R5qHyLjxXg
         EbUC4GU8Jwxwmt8T+r8QP5sH0dKkplNxwAtN6T++RpYMFE0ya7eITfJk1QK+ZnS5Ni9y
         w/0U9N2gww7NSoOOZ+mmErw58oiHcwEJxf6sbmARJXm8MdJZ1kCSQwWz19DBruy8pDWQ
         ZkEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795116247; x=1795721047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oJ9lQlnrIoDeye4I9sWURdg2kwBBKMsAxkmiWLBweSU=;
        b=GAkZbmnPpvFsFsqgo/LWj9XBPVO7UGtHR1bduh6eAqChw1OaT+7pFmFLFUubAv7nfu
         BTkx0xCdFfad6UgWlWiPpG09Dn1TGC6G/2rGD3nnKDl/M393MCnv+VlbnhmldaAWHEyO
         OFpf+48my2TINLNgBHd9E8ltjfX8lpbms4Iol7iQts+xWh4sY76cKi7P1VoA6jfBCu7h
         BVI9vXqyrLjAE3oLTUBzbtsvD8T03Zf7f6Rolu7FMuTv48Y2QMW6Ix9bd4cQwYYtrURA
         JkXAQS45HTBK+gnOr3e8MrHzvbRfUO35VlTO1lmIc14K37rAjRyAF098F+GCUjoAGob+
         cIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116247; x=1795721047;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJ9lQlnrIoDeye4I9sWURdg2kwBBKMsAxkmiWLBweSU=;
        b=o7S7gvwaVpEZKyGX+sQlTCIoLIdlb6fqjUCEDY7mSORMdXcqPYFzSYLMawqosGu3Md
         UWkwNTnOv9xHoa/MvyciSghCIsjY4hA+KN4NOc5lAu5B4z1df2DK3xs0B36J/2DF9yE4
         NTmZSYGn30r+N/uwM1xv+4PNI+tw01leWwPgqYEOu27YZUnd+lAO0e9YR8KGaaz3m+Xn
         4aC1z4q8Qu977DEwlrpsK1KS20meaCzpsr5sFN7fc4/nfruYAqTV+7lRR/pvVjwo/FZ2
         /j2eJEJ5tGUjnX6OyruUogjUfWxItK9VrnQweZylkq+oleeIORI2Jiph+CE+G9OTgUjU
         BevA==
X-Gm-Message-State: APuU4Z8LNunUtmh16s5L5uhjT4NPvfAtyxzfN9i46/xXfFjzoRs2ByuL
	MZlaacmBR056gd/EAnkgLUdoUdIXsqAoXuBKNNdWQCghaII5ffFxHC5Q3GxZNuRPvKgoRXFxS80
	M/ZStl6F+3e9Jh8FjOYDDeczgp+Ofj2E=
X-Gm-Gg: AYBFou13B2TlNszrXXqIwVSWXnPcrRU0HndPMZhms7ELvAtkcpjGKlfH5ALSoPr4RJ6
	U/iEwBaQVyc67TTrQVWIvKcTjYul6Df7+FMdOJ/MzpUVCveCWl3Tw7cEop6fblAHMG3f24gTNDK
	uVI8rUtBs25afDV1svkzlya0FfJ7W8pkdfISVprlA1fkcFDenWQC972LmsS2lesW9qzgYcL2h7I
	9Dpmy14WXoRbItmcW2r9Ynp7rn+LxDt5hTF9nSbLbQBLorEmm2xqfjuQ502RRJvCYbnrAcz3AXr
	G787mgWJIZYAJi/ZL0QsDSTxJ/nzKsqdJq77zTOHXR8nLfhOftUhAAni9o8nF5shNkao5OtKZS4
	h7dn0Xgm6P2vb/UTYLkz9ZZF4FC7Mz8CPCJA/V66nArw4qcZDUqF9ucwLrCrF1/5WB+A2wKwIaP
	vDcawhmA6ucDHtsog=
X-Received: by 2002:a05:6122:4307:b0:5c9:a60b:e5a2 with SMTP id
 71dfb90a1353d-5ee8af4fbdfmr474971e0c.13.1795116246978; Thu, 19 Nov 2026
 11:24:06 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179489221679.1.1429296960451969532.led-label-policy-rfc@gmail.com>
 <179510277952.63755.11124972443142013738@kernel.org>
In-Reply-To: <179510277952.63755.11124972443142013738@kernel.org>
From: Cristian Filipescu <filipescu.cristian@gmail.com>
Date: Thu, 19 Nov 2026 12:23:56 -0700
X-Gm-Features: AclHuK__KoKm0l4co8BZ367Zdnaot1-gmSZVSutowrjZ0dfQ-AxhOu-o9nn73F4
Message-ID: <CAH87RzTz0MuLP1yn25CCeL+TgDajNWNEvwZBVNJre9Gw2TFkUg@mail.gmail.com>
Subject: Re: [PATCH RFC] leds: DT: migrating existing labels to function/color
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee,

This is not a patch, but just an example of what it might look like if
I submitted patches to change all the LEDs.
I didn't know whether it was desirable to switch all the old LED
labels to the new format. But now I have my answer, and I will not
submit any patch to change the LED labels.

Regards,
Cristian Filipescu
------------------------------------

On Thu, Nov 19, 2026 at 12:02=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> I'm not exactly sure what to do with this patch, but not a patch, submiss=
ion?
>
> Sashiko already had some things to say.
>
> > From: Cristian Filipescu <filipescu.cristian@gmail.com>
> >
> > Hi,
>
> This does not belong in a commit message.
>
> > The common LED binding deprecates label in favour of function and color=
.
> > Is removing existing labels desirable when it changes established LED c=
lass
> > names, or should existing board descriptions retain them for compatibil=
ity?
>
> Removing existing 'label' properties will change the sysfs directory
> names under /sys/class/leds/ and risk breaking existing user-space tools
> and scripts that rely on them.  Existing board descriptions should
> retain their 'label' properties for backwards compatibility, though
> 'function' and 'color' can be used for any newly added nodes.
>
> > For example, the Orange Pi H6 descriptions could replace their labels w=
ith
> > LED_FUNCTION_POWER/STATUS and LED_COLOR_ID_RED/GREEN. With gpio-leds, t=
his
> > would change the names under /sys/class/leds:
> >
> >   orangepi:red:power    -> red:power
> >   orangepi:green:status -> green:status
> >
> > The example below changes two files and affects Orange Pi 3, 3 LTS, Lit=
e2
> > and One Plus. GPIOs, polarity, pinctrl, defaults and triggers are uncha=
nged.
> > All four DTBs compile before and after; comparison found only the inten=
ded
> > label/function/color changes. The renamed LEDs have not been tested on
> > hardware.
> >
> > I was thinking of converting all the deprecated LED labels, but I wante=
d
> > to see if this was something maintainers wanted, since it would touch a=
 lot
> > of files. Would you prefer retaining existing labels (potentially addin=
g
> > function and color alongside them), or reviewing migrations with the na=
me
> > changes explicitly documented?
> >
> > This is a discussion example, not a patch for inclusion. Preparation an=
d
> > static checks were assisted by OpenAI Codex.
> >
> > Thanks,
> > Cristian
>
> This does not constitute as a SoB.
>
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/a=
rch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> > index ce82aa265..8e4117057 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> > @@ -8,6 +8,7 @@
> >  #include "sun50i-h6-gpu-opp.dtsi"
> >
> >  #include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/leds/common.h>
> >
> >  / {
> >       model =3D "OrangePi 3";
> > @@ -45,13 +46,15 @@ leds {
> >               compatible =3D "gpio-leds";
> >
> >               led-0 {
> > -                     label =3D "orangepi:red:power";
> > +                     function =3D LED_FUNCTION_POWER;
> > +                     color =3D <LED_COLOR_ID_RED>;
> >                       gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 *=
/
> >                       default-state =3D "on";
> >               };
> >
> >               led-1 {
> > -                     label =3D "orangepi:green:status";
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     color =3D <LED_COLOR_ID_GREEN>;
> >                       gpios =3D <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 *=
/
> >               };
> >       };
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/ar=
ch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > index 57b137755..49f3d2fc8 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > @@ -9,6 +9,7 @@
> >  #include "sun50i-h6-gpu-opp.dtsi"
> >
> >  #include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/leds/common.h>
> >
> >  / {
> >       model =3D "OrangePi One Plus";
> > @@ -45,13 +46,15 @@ leds {
> >               compatible =3D "gpio-leds";
> >
> >               led-0 {
> > -                     label =3D "orangepi:red:power";
> > +                     function =3D LED_FUNCTION_POWER;
> > +                     color =3D <LED_COLOR_ID_RED>;
> >                       gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 *=
/
> >                       default-state =3D "on";
> >               };
> >
> >               led-1 {
> > -                     label =3D "orangepi:green:status";
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     color =3D <LED_COLOR_ID_GREEN>;
> >                       gpios =3D <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 *=
/
> >               };
> >       };
> >
> >
>
> --
> Lee Jones
