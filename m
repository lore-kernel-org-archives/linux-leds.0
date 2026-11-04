Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796013;
	b=jgTa12Uexo1R9pAxWoPnr+DtBHNfHZLTHItoAxHFg05bcRVAldW9+fYfb9N6lBvGjIA0
	 P12cvlfAczLIpwvFrNHq7V81NG67nxBdClJCbSMc63JBRMHArmlFAUzIit1MjSr88mAPi
	 qLnVg+FlNflXp0ya2+xP0DoULs3gQ56lwJa4ZwsU1fdLf4MP/Gglc8VO0fb8nTzmeoAXY
	 lXkIOtgI6+t+uTd7NccYztkX+pOSKa89wjSybJirCL29Jlk8MHAZ2ad3w/KCyJ2ikFlXY
	 iHVYg2HY+pnp+As/3PIBP55RRb2x1500uHjG0i7EP4VXCb5E8oVGmBKKKtmwIXSg+RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796013;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FHEx8OQBaPcg+rveUcMg3wbimaE40awoaJ4sXDmE/tA=;
	b=xF7hq5WuVTzUpxgb9FGYOFcpLtZfs9BxRNHE4BbPIbdmrdybcjE963oHHDwm5anBEJFP
	 87K+qAFVTt31rrtHss9zVHuWJZlZiCEIqw2GSSmP7VJHHZ3fnPnF1D1qoDsH4Kbk1Gcgh
	 8Ove7AWeO6VwAyuAuOaXU0VguLXXKGaUFnSXCa39H0SrQ23+SpmyXQE8E+g9YyhSBO7Uv
	 hvpi0hTWedqH72tf6q/hXhY9BCeHqSviqV2pyVSyM8r/a3hm9x8lSIydywujwii6atmJ7
	 AQYG2281HpikKEAaaoUyf5zK+H7WFxlpCIN+SGu4muQPtOEEL1wJh9Wq2DWKq9l0aJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZiXlKE+Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC10606A31B;
	Wed,  4 Nov 2026 12:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZiXlKE+Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB141F000C1;
	Wed,  4 Nov 2026 12:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793796012;
	bh=FHEx8OQBaPcg+rveUcMg3wbimaE40awoaJ4sXDmE/tA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZiXlKE+ZQS3MFwywzOveTs3CTJAmA4k34XsxxWT48c5fbpAvgEpeYnFDTAYSAJFKd
	 0XFG9A2HOQwFfTLBsk92FJwYgT+ht7mETb3htdcH9PZ+A5Ctb3mcXwlvn0lE1ZDqvQ
	 8y1mZSdlAOgzir2pzKOMBzen+zw9sXrqTjXjRVwU6ozxUvEZrktZQy2kJJNBERQBpS
	 fS5tf/hHr02gSJgSYGjfixRuvN6I8QTrd4w7qnHhzpBRq/eXtG5swqkK/YeqvbmHHX
	 /8KT7FqSDRSeAUkseUJppo/pHCJ4KDgxSJmbsQhwHYjGRLPkMglksbV49tlPBR2EqP
	 FxcEfNy/n/umw==
Message-ID: <sashiko-outbox-197279@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/4] dt-bindings: leds: Document Skyworks AAT2870
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261104123714.234634-2-clamor95@gmail.com>
References: <20261104123714.234634-1-clamor95@gmail.com>
 <20261104123714.234634-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 12:40:12 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104123714.2346=
34-1-clamor95@gmail.com?part=3D1

