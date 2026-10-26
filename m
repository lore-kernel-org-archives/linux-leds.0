Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044713;
	b=Lre2kvJJzdinpEk4EVh+Mf7I9z+2FvxxLowL91LbVCMdDlSJtpn3dExkkk6g77WekLkg
	 PqnJvLVoINCzQ3GBTy8dxAWGGU619wdMPWn1cGWqRjm2wQ4qVAVdRx1CVkwQIAnEwbwCo
	 ztTz3gf7lZMPG+aIHsHG80YqTh9nNWDRzDQc7JpjdxKlREYMKs7zdSjo+KChKpruQT3Jz
	 jXJJa+CwkevGSZ8b33T2m2EM3c0Rp9Sf0ZBFIwPsj10eIk/IUhtf1AA4oZPlwQuDUNVYj
	 hwlwdTcDMYCG8YQAxMFSBRvS3o49a2sL2zAEkATK2SAJO4W3Srv/LriIa0gEpJScx/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044713;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3Gk2Vsc+J2v6vAoeQJxVwsf95CxD/wQab+BWuEYxPeI=;
	b=Fxo0mpb+g1+ohR+gCu62bAv5E1liTtLarmiUxv4MWFNnjQ97BbSwj58gydbZiW99zZFv
	 dXypmSl5+ekkzeGNI0097q4bHkHMYzkMcL6MnH+gt95dSBJL/jjuAPfkNcMs//1H/Yuvc
	 ROsD+M9cB2OZq4z5a84jrhxaJnudhETzcFqc05jJ93ht/4G2zDyTJbZMpk0AYZOS3IPWx
	 v3HecLPV+X+GCL+yPg4wlh1qxrTUhH3CRcav8eRayHMVxI3oricuI1JbKH3eYmDij73vZ
	 ZdLtkCmHRBxl576GLjPD18Q+ZEgR26dpDWAhNdYpOqSmyqhjh9xbpWQMFU9sT831nLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kAkmBRzM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64857606A31A
	for <linux-leds@vger.kernel.org>; Mon, 26 Oct 2026 19:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kAkmBRzM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21C51F01825;
	Mon, 26 Oct 2026 19:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793044713;
	bh=3Gk2Vsc+J2v6vAoeQJxVwsf95CxD/wQab+BWuEYxPeI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kAkmBRzMXjR/60mz+PCZM30DQlGeYPlkEJQD9qg1JjDeoGQCS53wHjWZ/Z9YzG2ps
	 ZaGb7115nRbo7Mvgt4e4MzyBG1KbJCOgifKJorvDcJyGsm2jWm0eka4Z3hYS9LWENt
	 C0aebp2mUDbisLVOC+fgp6FOf+xtOdNYstQMsnmicu2bPbfVizJwCAuSQcRD2BPX2N
	 7ixqyh2yLAPMpVPzmOtvsa0wK9LKqJdOBRY/DwPOhE4BSjF6itDYf1YHSMnI5AZ+lS
	 1H7KE5FBh1/FSzj+OJFIXGH3WoP0l2J3u2rmSugT8v9Xo5Kq2QA1xoi3iI4POwaYEe
	 mKPnv5IM4ClAg==
Message-ID: <sashiko-outbox-185697@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] leds: turris-1x: Add support for CZ.NIC Turris
 1.x LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josef Schlehofer" <pepe.schlehofer@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261026195120.12759-3-pepe.schlehofer@gmail.com>
References: <20261026195120.12759-1-pepe.schlehofer@gmail.com>
 <20261026195120.12759-3-pepe.schlehofer@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 19:58:32 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Pali Roh=C3=A1r <pali@kernel.org>
>=20
> Add a driver for the eight RGB LEDs on the front panel of the CZ.NIC
> Turris 1.x routers. They are driven by the CZ.NIC CPLD firmware, whose
> source is available at
> https://gitlab.nic.cz/turris/hw/turris_cpld/-/blob/master/CZ_NIC_Router_C=
PLD.v
>=20
> The WAN, WiFi and power LEDs use the multicolor LED class. The five LAN
> LEDs share one set of colour registers, and the CPLD can only switch
> each of them on and off. The LAN 1 LED is therefore the only multicolor
> LAN LED, and its colour is the colour of all five. The other four LAN
> LEDs are plain LEDs, and all five have max_brightness 1. Every LED
> except the WiFi LED can also be driven by the CPLD from hardware events,
> exposed as the private turris1x-cpld trigger.
>=20
> The controller device exposes the global brightness controlled by the
> button on the back of the router through `brightness`,
> `brightness_level`, and `brightness_levels/<N>`. `brightness` is named
> after the Turris Omnia attribute, but it holds the 0-255 value of the
> selected CPLD level rather than a percentage.
>=20
> Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
> Co-developed-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
> Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026195120.1275=
9-1-pepe.schlehofer@gmail.com?part=3D2

