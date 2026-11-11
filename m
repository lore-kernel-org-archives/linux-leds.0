Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415685;
	b=y6JCM9XZo7f3pL4/2mpT67WbEsF1ls/lO5xYjwQtQjuz/wgBrQ0N9sWJ21jdKHPPN6We
	 QDSJxBJ+4kbk9CEKkBN8hWk2bQyoufFO8LKHTt64f7v+lsDGhuhFKPbBlUqnHgb7+Dlxs
	 2Og1yoR7OCu0c1xwitB732NUkAG+E/T98K8Day9rJBhI5loWLTqN1CPBkIBj7CduQ3orm
	 GdZAeaxmc/Hz75+pRH/2F6+CSYwRWMNbJ+v5HYRAe+WaBU+BReSLFo5pqACfPxbnsOsJY
	 0v1nmjhlYsMO/MxwGqX0i/XtX+B0vv2EjCpGMsXoer1xIQ8dksFLcZcM/2VuSq8uyYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415685;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ocydYVWR6ROXvwa9zDyIEXYbUyDtVhGsde1xaEMoCPk=;
	b=KlPy0MYqoxQiAJCXxNpztbysNLlxBde2FpOI87jEe3/fo18gB4Fo2Hb9teI8ff3kFDms
	 NnjaJf/TDaKLzM4bcKBYjAQ6GpyeiRZnGney0KAxeWq2wAb2IZFR/j2d8FZXIu003iGkU
	 9/2kILyvgnDg+0sRL/L27vT4MSWABtQ+4ubrLeMi1uCg869z1RvYGSKubWNjnNYqSHluf
	 7qNsQFJXs28oMNFRHrn/7VeGGaXEXiSvA80QIcdV7/6OqyZZLULowIeI631gaDo8XB1JI
	 3UJapOiLSZDZBB5YpOz9gyqoJOHR7QebpcScWLVlm1Y8L04UU0fJn0Qk0AVTSrq9SBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hWZnfJbT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7DB606A32A
	for <linux-leds@vger.kernel.org>; Wed, 11 Nov 2026 16:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hWZnfJbT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FBB41F00A05;
	Wed, 11 Nov 2026 16:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794415684;
	bh=ocydYVWR6ROXvwa9zDyIEXYbUyDtVhGsde1xaEMoCPk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hWZnfJbTpPPOQg03+VEJpc3DyZ8unaSJ1VRMZbxBf9fM8zmKpmn9EM8uCcgs8hMCX
	 7Ap7Meh9GK7EOaBAyy47SaODyRTdEzvl9eVqlg5KvfcGvpaifc0E/SwOZUhc5fh0ka
	 HUOmL5up2l7VhqN+49DG0+v2GmMWHDdUT/Q/8Qq1hzZyzD2nopKeriFN7sY0TjZs8+
	 EUm3Qvr1H9XgAQFiiNBkbJbIfzEG2uMlH0WQJvpKdh5Jl/5baIu8XUUK1pehdc5aPR
	 m2+D6PbIvSDhKtnMMF4aFlkQm9JsiBfW3kpU2DJkW51C7kY0iSEq6eHrmGqx5SPddj
	 4FBDOeFARd0qg==
Message-ID: <sashiko-outbox-209323@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: lm3630a: Add
 led-max-microamp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michiel van Beers" <michielvanbeers@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261111-lm3630a-led-max-microamp-v2-1-aff11756e7be@gmail.com>
References: <20261111-lm3630a-led-max-microamp-v2-0-aff11756e7be@gmail.com>
 <20261111-lm3630a-led-max-microamp-v2-1-aff11756e7be@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 16:48:03 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Michiel van Beers <michielvanbeers@gmail.com>
>=20
> The LM3630A has a full-scale current setting per control bank, from
> 5 mA to 28.25 mA in steps of 750 uA. Boards whose LED strings are rated
> for less than the chip default of 28.25 mA have no way to describe that
> limit.
>=20
> Add the common led-max-microamp property to the led@0 and led@1 nodes,
> and reference leds/common.yaml from them, where that property is
> defined. The property is optional, so existing devicetrees remain
> valid.
>=20
> Signed-off-by: Michiel van Beers <michielvanbeers@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-lm3630a-le=
d-max-microamp-v2-0-aff11756e7be@gmail.com?part=3D1

