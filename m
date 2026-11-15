Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794701705;
	b=fFiNiwZZH2U5Xqgqm7fSiaWbea5Kqpx2vSQ9wREL9/4f/GoRNH9Q0yUwZXFII3gsJIPT
	 bZXzyE85oYlLJLb4W/vAgnzAXOhWy0a8tT1UXecBurWSoWqs076ugXKXRoUBzGFj4SN7D
	 kSAw9fwalBNwYrV2hlgeyIjY58ZsFcRvEyQp/25QrJRus4cw1o24gjt+W56x17kRigu8U
	 Y7/iSOWd4dsctfBVrJFDhcPc2gCArGmZLJEO/bxMvPoury7Rud0lVySjAjirTDMN2RnnD
	 0U55IrSNeTyGbpJGBfvqqkh3PikVORhL4xLNtrW3JzLK4lbnHXwnu5zOPF2II3dsQxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794701705;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8H4uIgh09bcHnr1EXe+cEDipKlWIiV7HV/3yg1EBKiQ=;
	b=PpFcJ1P+KvAawwaqaW6US7VxQNPvAl9GOEpxdR1ETqlEHajxTIiikaIJFCNwc7uzmt8N
	 CFv/nMeFJ53AnjdE7YvGLxVkIU/4uFigmyWxARTGWLJHDKc2MIu0nmkTqHt0kqebglNOh
	 K3XiYC08THgLK9pIEF+8COqtD58o6z7glCT41DGUpuxhEmf5ERhnITIWhSemJqSAhMFyH
	 9OXY9calhZ5rhs6QE5FMuETNthdw5KwXMQ/ZLFzb1ASECzTlUupOaXku5O07apl9l3RRS
	 YyM8jcuu8J3j/LQYXgGB2DxgLO2RTspyLvSWJspGzOcwGlhz3VVz2Ims0ocvGKeNFMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E9oH7mDz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C640B606A327
	for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 00:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E9oH7mDz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE5D11F000C4;
	Sun, 15 Nov 2026 00:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794701705;
	bh=8H4uIgh09bcHnr1EXe+cEDipKlWIiV7HV/3yg1EBKiQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E9oH7mDz0jbZmKe4DDAL871Hwir8hOgdr1yo74AcGimv8vmUS/4eZbrqduRQWCfw0
	 7DyEyxKlTQyOzlAMHrYlZkAiPTKiQHBIoBdif8Ar404dltXd2ndELFFDxOb1ilxDxA
	 IUClwa+5Lh0PBT2xpO0daI6wgeCYTgsgSDiJ1kA7hYEOnFAlIiHvuOVsiOfbgiNHji
	 JnC4uzLIIES/D9VAVPH/kfzo+uVShIQZIova84j2H0jQRFPxix418A/yvZcFRN0lyC
	 /jZ5RNzTCQcfIj1Ge3BMYuL1VQElsRFMiNsc2cIfPl38G8/yjjI/neJbnh/PX4dz5e
	 siRmzQTD1UCjg==
Message-ID: <sashiko-outbox-215141@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: leds: Add issi,is31fl3206 to
 leds-is31fl32xx
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flavio Amieiro" <flavio@amieiro.net>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261114-add-is31fl3206-support-v5-1-332db80233df@amieiro.net>
References: <20261114-add-is31fl3206-support-v5-0-332db80233df@amieiro.net>
 <20261114-add-is31fl3206-support-v5-1-332db80233df@amieiro.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 00:15:04 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> This is a 12 channel variant of the is31fl32xx led driver series.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Flavio Amieiro <flavio@amieiro.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-add-is31fl=
3206-support-v5-0-332db80233df@amieiro.net?part=3D1

