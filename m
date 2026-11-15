Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733292;
	b=uk3vKzrHKdm74+dxcAr4Kmk2T21cFSfa27OckdEsGLX6njUYKB+s7WIGEBy8WO+dEptF
	 J0um83Y89cKJcADhfQIJW+vz2CyEK/kcVGFCFA9+nuDMGUP1w7xNaBid9Uwa1ApWSgr+Z
	 NSofGzcF1hfik0yyTs8PuwSQSPvrADsM8Nt7NvBuCM8hyCLpTO2dqiOtWKwIuQREfhHYu
	 m4lfDtUtfoc+GMbUyuYhdA53Rj+9vIfGD7rwORbuhbxVG4vurE+nFgrO1ccrYtJjQrmcU
	 ER5SZ9V0ZAjW3bd1WptUNGvy4CQ8ZGyWtr4CJr4L/Ca1rOfSY2mheK/G14o/CEPK0Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733292;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=t/njQg+LuJI0VOYwET/Zb/FclfRgelmXmTnAskvpw1A=;
	b=XUnsoKBX0QHHhVPdN1nl84FpYPt2YqnKJ3odptFFTi5Eu2VIQ82+Skp42xoRQ1DeFKOt
	 D1h1NKhCNMpKFWp61fMrpv0K+NEPW4qSIav47PykyGNy8xA5Q62riYwRNWzhIz6B2diN6
	 Tc8TgBWo9xQFXh47DMQMzJWIWhsyykW6zo8il4bbXRyWnhWzKRJdJUIx1TgwF4lyyMgWj
	 wZ1u+JVwU+ff9FWCptY9RPF4MQS6WeeQVcE485MBbHm1JRVKCESZNKERi7jkX0678SQHx
	 U/Z4xZO/C3C4n9pU0dWPIDHXAOcRYFEnaK7ZH+nPRmnhbm84ql8Nj0JpRK4tGHVyc/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ndc241Jc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AC9606A31A;
	Sun, 15 Nov 2026 09:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ndc241Jc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F9C1F000C4;
	Sun, 15 Nov 2026 09:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794733291;
	bh=t/njQg+LuJI0VOYwET/Zb/FclfRgelmXmTnAskvpw1A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ndc241JcwIn7SYuB2aSnRKpecgq080kAVHnxz0uIvOO6b69O0M5lxl3Ex76tudL/K
	 0yAhuSvjW0Ag5s+rQ2X+40/0JTemeQg6BHfww8wRoHjx3rAIkLJtMFxYIvq8L7Rd1z
	 07xWf2AzFwsWTcrHJi4IhjaiD8Va/J3QYfedFyre1wtkZswVF47IvXpVfwjXAJm/oW
	 yEWOauifzYXxzhzVBFnA5JhQ8YHLpW89GD6mUiFsz3y9vNTauP7SChvyScWS3P3VI7
	 kW81uva77BpF97kP6e5oF/OOxgQ63iUpntelW3ZogATz8Cnc9+KOMzpSolo+/y1Blp
	 l0Akye/6wumkw==
Message-ID: <sashiko-outbox-215320@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/4] dt-bindings: leds: Document Skyworks AAT2870
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261115085826.89641-2-clamor95@gmail.com>
References: <20261115085826.89641-1-clamor95@gmail.com>
 <20261115085826.89641-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 09:01:30 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
> Management Unit.
>=20
> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> # for backli=
ght
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115085826.8964=
1-1-clamor95@gmail.com?part=3D1

