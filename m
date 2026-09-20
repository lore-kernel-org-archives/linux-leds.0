Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4788D23ABBE
	for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2026 19:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789934256; cv=none; b=Ixa11XzRvk6zV0Gu5BHbK8rp4+SVKF5q/7pFIvfk5Z+n9B4THpZk8JnLQezy/4zitlgaP3MfZRhMU0XktfZYpnPdoWqJY3yZKHAg8iLutXDGQACHBJZaBYCB3OuYW9Ab1HCCiyoYtSeZaR/STJNzBUaVgVUZ5I4q4NAsjEcvVe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789934256; c=relaxed/simple;
	bh=8E12HbYrNBAfFicNgydcI8crjZOs94DWdWLKzkgIJ4Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V5ol5C+/Ss0ahzdSLgw/fPsXZXDquqjGmgZ5OSH/vHk+tJsZDLL1YRMQ74bc5V4BmlTcQCU8cmBDAnvMWmNNGIMWj6NRdekT3zb59+oE37nhzFrplUy3IouQJgecUZqxBls6RpM01zhyb6VhP2FWSTXccfHx2ME94yN2iB/pBnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/dAziqX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/dAziqX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91541F00898;
	Sun, 20 Sep 2026 19:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789934255;
	bh=8E12HbYrNBAfFicNgydcI8crjZOs94DWdWLKzkgIJ4Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N/dAziqX7fFPhXpu5D7kJVkCkcD15NkN1ccTf5UMdIQ3sWfPKNU+Y4i9aM5d4M7Rs
	 qNyg9+DVGy1gkykG7wAHkjBzEdcWTLb2xKv5b0CN7+QDn4jM2dPZttYtiHdPYvnbJU
	 XdG03PIZkqvl7UjdoBbSVhAz70bUflPPXAxDBrTzh8KeN191Gnt46NXlCql0yMzph8
	 tBt5jxaGlJ6PLpeDY4wUCtQkvk5Z3loZm6kPBK2ZjTeP9C+pZB+VJTu8QRlkGbZxlg
	 xF8bAMYHI6jFRyronVzAh5mmnNDNsn5/ja2mSy1aCvPvC7nBvJgf6EcmuENRbR+JUX
	 mQhevOQZqCB+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 08/13] leds: trigger: netdev: Implement
 hw_offloaded() callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260921-leds-trigger-hw-changed-v7-8-fe3cdb6dec51@rong.moe>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
 <20260921-leds-trigger-hw-changed-v7-8-fe3cdb6dec51@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 19:57:34 +0000
Message-Id: <20260920195734.B91541F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> "netdev" can run in hardware control according to hardware capabilities
> and trigger options.
>=20
> Implement hw_offloaded() callback to provide its hardware control state
> to the LED core, and document the relation between the custom
> "offloaded" attribute and the generic "trigger_may_offload_to_hw"
> attribute.
>=20
> The callback mimics how the existing "offloaded" attribute does, i.e.,
> locklessly reads hw_control, as it's just a hint and don't need to be
> accurate.
>=20
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-leds-trigg=
er-hw-changed-v7-0-fe3cdb6dec51@rong.moe?part=3D8

