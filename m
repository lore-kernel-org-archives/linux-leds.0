Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506033;
	b=ayEQrXnblYzOp+N465YqoPqXVPD1jWQTh+kUpDrGFbYLEEIYcgsD33XLskEwdyJ5i5ls
	 bWsAW2LqfTQuOSsSmv28T5Pyt4BCE3H7RxtCigK9715boCZZzWeA+flDTiQ09qQwChzdA
	 BP5tdvvo2gjiNb21Kmi2nGe3ppqjmMUjGSmoxYBBjXu9xeDzXgCJZxGoY//9yG09BeuMo
	 exdP14p3fudSGd3ro8I7tHHi4s/6C5e9W8Rvl09TF11L1mReBLDhzDJK0UuYPJvlrGbBY
	 XCAWbAn54/cZS5aGmtTxtP262QMZTDr+fq3yBs0OIqsBWJE/ThBQdLDyEi9a79JhqMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506033;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yQnefspdcKZ/GcvyTFC4c6OWRm4U0T/ukYXcetck0+o=;
	b=0tjLsnfRXVw2nOy/DoQByKrz2t/n8mVWbqs2LcDPmHfdxmIVnyMAii77QcbG4WlaTBtb
	 8NNvkYYMUI0VgI+pAAvjORbSWtlYrzSdVkh1WxhG8g8bHyCFatElV5/DfNB+ydVKJkMAG
	 et6TFECLU3CmYad8vJo35ILn43qtwi3E2MpkpVw2zzmEXpub9lLyM8haf2+XL2CQ9uXBK
	 bHiDaFawQulRGa2czBfPEzr5y40y2PNnl7yPnwAx2Z1xZmHbOuxA60LBH94UvQ4Rl1Pfm
	 5ggI5wl7ihpv9wX38w7eCgAzHTWFLzF9/Skuu+vqNQt0grcC1RttbFb0Wj+M1F3JXcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e1LZ1Wpw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E74606A321;
	Tue, 24 Nov 2026 07:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e1LZ1Wpw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18A01F000C0;
	Tue, 24 Nov 2026 07:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795506033;
	bh=yQnefspdcKZ/GcvyTFC4c6OWRm4U0T/ukYXcetck0+o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e1LZ1WpwZpis/XkiuDjAePAw8+veOH2wHniJfsT0QZ/i2Pcu9+pY+PZkR7iaABhtC
	 gEJL6bR27OzqnnRjYJMG7uOKzpj+Po6pn/usFmyOKU3Br/3T56WxYv0dN7YYUGAUwz
	 8ZPKIcTHP8X4wKEvGzihXUqavN/RVAuvCY8Dm8d9Z8fE6PQdmcZ8OQVmHxctV3tURp
	 2qnEIKqPxtxg4IPctHlsKV/XJ9Z1sDmh66B+Yll8F05DMNBKX7N3t8oiX0YYvp+aWN
	 5TSv+D5IBp8GYp4EXl8G9wDpoeJGiVfcOFJNwjFbrk3bfy3BOlLGf3FHlHs4W9ad1K
	 od244WfuII2sw==
Message-ID: <sashiko-outbox-230656@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 16/20] ARM: dts: omap3pandora: Describe PCM1773
Reply-To: sashiko-reviews@lists.linux.dev
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, linux-sound@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <770a015f333c1927fccee2663eb76a7de923dffb.1795505160.git.hns@goldelico.com>
References: <cover.1795505160.git.hns@goldelico.com>
 <770a015f333c1927fccee2663eb76a7de923dffb.1795505160.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 07:40:32 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ARM: dts: omap3pandora: non-generic pcm1773-codec node name used
  as ABI
--

commit c8d3624565f86aa716a8f19bdd1dc4e2ff56499b
Author: H. Nikolaus Schaller <hns@goldelico.com>

ARM: dts: omap3pandora: Describe PCM1773

This commit adds a devicetree node for the PCM1773 playback DAC to the
common OpenPandora devicetree.

> diff --git a/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi b/arch/a=
rm/boot/dts/ti/omap/omap3-pandora-common.dtsi
> index 2a5e8ba5714da..6e349f7ae6936 100644
> --- a/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
> @@ -64,6 +64,13 @@ tv_connector_in: endpoint {
>  		};
>  	};
> =20
> +	dac: pcm1773-codec {
> +		compatible =3D "ti,pcm1773";
> +		vcc-supply =3D <&vsim>;
> +		enable-gpios =3D <&gpio4 22 GPIO_ACTIVE_HIGH>; /* GPIO 118 */
> +		status =3D "okay";
> +	};

[Severity: Low]
Should this node use a generic name such as audio-codec rather than the
chip-specific pcm1773-codec?

Because this root-level node has no reg property, of_device_make_bus_id()
names the platform device directly after the node name, and
sound/soc/ti/omap3pandora.c relies on that exact name as an ABI:

sound/soc/ti/omap3pandora.c:
SND_SOC_DAILINK_DEFS(out,
	DAILINK_COMP_ARRAY(COMP_CPU("omap-mcbsp.2")),
	DAILINK_COMP_ARRAY(COMP_CODEC("pcm1773-codec", "pcm1773")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("omap-mcbsp.2")));

Matching the codec via a DT phandle in the machine driver would allow a
generic node name here without breaking codec binding.  Also, status =3D
"okay" is the default and can be dropped.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795505160.gi=
t.hns@goldelico.com?part=3D16
