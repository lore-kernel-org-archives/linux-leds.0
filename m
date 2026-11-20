Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133356;
	b=0QWadPoJ+BTkXHl8ruTjYicwSo2QNQTk3MQ20E0HNKroneDYHxyG09GK9vEL67XX5HLW
	 xfjcycQuOKvXs2IPNEMEHts7MMNyTFGU29fjZj+vZ6bI8ToO13q5rzEsWWAsc0fHaVl5q
	 4RS3iP3o8BjRa0LcbGAHbRY8Ki03QVcemkRMlYKi7lc0MTNmCdB4tpjManpuDdeEIG92k
	 PBM38WufSLSMEvJHhMe72ZO2aVxE8F2mXDD53B+jTvc9qHAiddUsmX5vHFVk8sEq+youn
	 8VAFASwFsrtiYKEsa6qJcYwtq+3BFA9y8vtApGQAaXN5TG76QJQSXtpsVC5bDhnIhOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133356;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7SkqXEpRAFnPcMtWXMxjbQVlRGFkEhwuuahID8c08Fo=;
	b=L4NuMTQOXdm+ixnvGVM7mUYqHVbuOYLUmcPAt8lzDDHG0qLcPHmrr7Vzwrz4Y33qg/Hj
	 lGtnEh8w7OmHWgZszI9amC/ughBjnIak+lElIimDbqUsfiCm+IOiCdEaF7gvXt+a5WNrB
	 1jvFNH07r2RYFwuw1qMaWmuhLRolAJdfImAWeWbwKomM6cIFPXe3ccsJXIOr9+95TyXtc
	 J50r+7yjaDuhWbRr7lh+NDqQeTkuJ2wvQIY/P4qmOKH0vwh61UP0rCkPqoZmY3Ug6/FnL
	 wBLkldFx8AeEvebXGDRkl1tM73f0tP6YyMShsYthMHMvKa8V/tXtbvfTkLwnlqa6vjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jog+DFiz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9D8606A33A
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 00:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jog+DFiz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74831F000C4;
	Fri, 20 Nov 2026 00:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795133355;
	bh=7SkqXEpRAFnPcMtWXMxjbQVlRGFkEhwuuahID8c08Fo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jog+DFizpQIbvmh5LdXTXVLu0NLYdQs7I2hPT6IPsv/gVXhQxZjZpyJbyOAA9ElJp
	 2TcEtAYp2NiavS/IPucUEekSDA4HYypPW/UJEtdXL7gsSYTBKoeNVTIR+sJVM79hsJ
	 wNoljmNDJ2eeA8ISE59R9dsmUZnofi4HeFgdiQIHRSbcqkGzd0gL7ECj1fOfZ42EkZ
	 VdZLUdacxgMYx3lw4mmy9t3t+PqNrIK59gWXI9bpunVk8PiSUCkYq0E/6xhfKSB4Jg
	 EGFfa+4PCy/yj/r/YqfkI3WTJcR32ncJpig2ekRCJdcNGeV6KEwmpRDF5xk+iG1NRr
	 lGGwv1BsWpVNQ==
Message-ID: <sashiko-outbox-224241@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/11] dt-bindings: leds: kinetic,ktd202x: Add Etek
 ET6326
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261119-ktd202x-et6326-v3-6-98b836b1cddc@telaak.dev>
References: <20261119-ktd202x-et6326-v3-0-98b836b1cddc@telaak.dev>
 <20261119-ktd202x-et6326-v3-6-98b836b1cddc@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 00:09:14 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Joseph Telaak <joseph@telaak.dev>
>=20
> The Etek ET6326 is a 3 channel LED driver with the register map, the I2C
> address and the current steps of the KTD2026. It only differs in the
> flash period, which is (n + 1) * 128 ms instead of 256 ms + n * 128 ms
> for a period setting of n, so a KTD2026 driver runs it with blink
> periods that are 128 ms off. Document it with the KTD2026 as fallback.
>=20
> The ET6326 drives the status LED of the GL.iNet GL-SFT1200 (Opal).
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-ktd202x-et=
6326-v3-0-98b836b1cddc@telaak.dev?part=3D6

