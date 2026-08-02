Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAF922FDE6
	for <linux-leds@vger.kernel.org>; Sun,  2 Aug 2026 17:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785691906; cv=none; b=ih3F6nm7I+KQNQIdcsV3k3FtGgEJEoGkRsgfmd9POc3LVqUGF5TbTSKx0ZVFiUwaqzuZr1wCf7nPaDlM+7tI6IG2HbSJjUPB1wCcSmHqLmm7rexnMU00hHUziyavZtBTNdUR1FKBXCeQ6+rVnBIT2IrQgrftlyYc14plsmNazsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785691906; c=relaxed/simple;
	bh=xB5VrZkCfE13R78aOYNNUrHu8r/ZrDPFXX9WgX/DCEg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rbua7la/4TKIb8ov/d4mOA9W6DaR+ek9+XKSeUfplvw4sjzXoHbJlGY4EbimHkSlIQnOJDFDEiSEcCceZDpOwRTbzaoET3ktYMdR8dmJEmaKmk2az1FCo6z6XXfw72z9KyO8XXQC/y79ED+eeBGyBFmunXeurD9kLa+fTxCQgQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhYx770P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhYx770P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EFBA1F000E9;
	Sun,  2 Aug 2026 17:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785691905;
	bh=xB5VrZkCfE13R78aOYNNUrHu8r/ZrDPFXX9WgX/DCEg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dhYx770PMI1pdaNMuLDQn9G+f0/31EzIIg6SgmmwQAai9MPTC99YOxm16E1yfhGQ2
	 rQ/OQwZnxHyZEQEo1v6adMAIe9MpBdLWFoaS6wERBMHjaVC0h5kQI8kjjNszvtLdgc
	 m3eP/ZCVcJ/5WtzNNR6c8ENMKTY7k5wH2taLuCnatvigTN6iJ4hSLL2AvCog/WEaJo
	 Zd6tXJPJEVnVG7WDX/TJFWms3FoHNGu2t4dLKsmSh+IjqdJuJmq7Y4HgkWshTJ9wgm
	 gCK6tBjUBRWU267ItAuFBX99eqdvW/IoFAq1aPzBK8Pm0wfKOkqmFWp2GxPFPBn+WJ
	 VsIC4FltNoOLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/12] leds: Move led_trigger_is_hw_controlled() to
 the right place
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260802-leds-trigger-hw-changed-v4-1-f97e2ca976fe@rong.moe>
References: <20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe>
 <20260802-leds-trigger-hw-changed-v4-1-f97e2ca976fe@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 17:31:44 +0000
Message-Id: <20260802173145.3EFBA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Currently led_trigger_is_hw_controlled() is placed at led-class.c, which
> is not an right place as it falls into the triggers namespace and does
> triggers stuff.
>=20
> Move it into led-triggers.c, and split it into locked and unlocked
> variant for convenience.
>=20
> Fixes: b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of hardwa=
re controlled LED")
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-leds-trigg=
er-hw-changed-v4-0-f97e2ca976fe@rong.moe?part=3D1

