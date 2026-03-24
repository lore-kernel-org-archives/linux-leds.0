Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1E43D3CED
	for <linux-leds@vger.kernel.org>; Tue, 24 Mar 2026 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774346008; cv=none; b=YdAn/0M9/1qXWCHQ0bUL+uAmnQNw+SJCiS4oy2Nq/WnTHHjib3fVpVGXpoGADC3QyixAc8A72N7h+1sfF7W75aiDUEAGSNie1dJclpVjKW6ljZblFHFuILnsh59C6wHFewVDdbytx9KmB2G72xAb2rCsn0NLd+w2WaxlIGmdxi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774346008; c=relaxed/simple;
	bh=5MT8PDhOYBMYWmqmrRBQBWxZxI4+1aBD255erJz/T9E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MOHckPcc+JJ3ob0VSGfiI3zU4E1hD6o9PBsz3V7wqFTdh2qWv7jLhERX8VPqLr6Mm6Tgn+Ke+koqTmkIoDiFLaKcOePno9+5R9+P2u0BE1xHcUSRFBAqMJyq9VP0XsTJKd1GETko6LA/Mf+wnw4xzTA8VRzRTRnmnR5YXdExi0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=o2JHj7SC; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="o2JHj7SC"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B2B3AC58095;
	Tue, 24 Mar 2026 09:53:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D38B6011D;
	Tue, 24 Mar 2026 09:53:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3EE7F1045119E;
	Tue, 24 Mar 2026 10:53:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774346003; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5MT8PDhOYBMYWmqmrRBQBWxZxI4+1aBD255erJz/T9E=;
	b=o2JHj7SCfm6NxR8ecid5mgKuScpWezj/pLsD3G5WsC8PJXTs4QqAMDv/XTBtw/JQNowi3r
	AIpPwPrFM2qJuFHBkmHs1NUyMENi0b7W8PGKU2eowRh8fuE4FESpCoDhCr7AQ41SA04J7y
	3Wq1nXgjs0F69CTcVkp3CY8mcVPvRtzRcDyrZr3AOADFSTrvagmokE/8IntLbzcd8V6h/f
	yHSucfFfIirvSloVsQCJmIG3YVJY86lcn5BW5AYdXUIcKdfcRblxgLqzBvsR7RniQgczb/
	ETrf9Wz/LpE70+IOqA9rcaU7AVJNz27s8nI/6avR5IITsLSuulKCE4VexQkntQ==
Date: Tue, 24 Mar 2026 10:53:20 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Carlo Szelinsky <github@szelinsky.de>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: net: pse-pd: add poll-interval-ms
 property
Message-ID: <20260324105320.70225b50@kmaincent-XPS-13-7390>
In-Reply-To: <20260323201225.1836561-2-github@szelinsky.de>
References: <20260323201225.1836561-1-github@szelinsky.de>
	<20260323201225.1836561-2-github@szelinsky.de>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 23 Mar 2026 21:12:23 +0100
Carlo Szelinsky <github@szelinsky.de> wrote:

> Add the optional poll-interval-ms property for PSE controllers that
> use poll-based event detection instead of interrupts. Defaults to
> 500ms if not specified.
>=20
> Signed-off-by: Carlo Szelinsky <github@szelinsky.de>

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
