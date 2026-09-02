Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448C73DA7D6
	for <linux-leds@vger.kernel.org>; Wed,  2 Sep 2026 18:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372958; cv=none; b=d+FDqnjW2tHj9yJhviUSJ1Q2wqroD21IUl/pU4P9NeV1U1kmSV3BmdyBYiHJytdKKUYHNTxbZXtVeMfpJnN/noY8lai4xZO/h7DBhc0LBgiht+gg0Mpyg+vPXtFVZ7quFnMOuOrIyb5Rc3CtvCyK/tUFJvG2JqUq7z11XLJMvHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372958; c=relaxed/simple;
	bh=nUyY3dV/IHsmLBVTIMtFkMJBRNshEIicITon6PEZIlc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aACtaeSfWu4rqaW+eEbqCdCLgGpfVVhGHx7DwUFwzjlRDEZ1aBTj724tlt7Cuai9CsmxmwzUqn24fnAfHhLZ4H06nCG2QTvLWaRTEB6z9Aawp0dm2heDMRk6e+3pUg8+vm/yMyAXqTFWvXqgblGRaCkaJ36qVWE+Vc5GOHJ1KNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nirJC8dk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nirJC8dk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63E41F000E9;
	Wed,  2 Sep 2026 18:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788372956;
	bh=nUyY3dV/IHsmLBVTIMtFkMJBRNshEIicITon6PEZIlc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nirJC8dkIUH+waqXj8PbA00dAPe9l/DL//Ymkbwu++YkfOgOgADv/EIMW6TFbGw7z
	 FDCop27EtLZmyG3QJ/+5g1c0qVTyt6ytcLI0iQkLxaMwU1jmG7J9rsLRWgzMj4ldtH
	 aSsQwVJcRKrAvRK7UnOzWvHNXfA7ZpXl4eZ8jzxfEe3U3CAPOcUYtydevyMHEPn07A
	 UrMGpxLEudJokjI0ba9INyuzZx9hBN+eotVgYDWgf9sxzwmtG29CA/5COC5vuvbCM6
	 am4lYfhqm3VeD6req+GTeUIw1W2vQlcGZ3lEmmtbcxilAT7jHlIuouDLPsMB1/H4Zd
	 9HQxI+z55ImYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 01/12] leds: class: Always protect brightness_show()
 with led_access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260902-leds-trigger-hw-changed-v6-1-55693cd78877@rong.moe>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
 <20260902-leds-trigger-hw-changed-v6-1-55693cd78877@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 18:15:55 +0000
Message-Id: <20260902181555.C63E41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The led_classdev_register_ext() protects transient states when
> registering with the led_access mutex and relies on all sensitive sysfs
> attribute callbacks holding the mutex to prevent exposing transient
> states.
>=20
> The Fixes: commit broke this as it accessed trigger_lock without holding
> led_access. Fix it by protecting brightness_show() with led_access in
> all code paths.
>=20
> Fixes: b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of hardwa=
re controlled LED")
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-leds-trigg=
er-hw-changed-v6-0-55693cd78877@rong.moe?part=3D1

