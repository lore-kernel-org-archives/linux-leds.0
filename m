Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794683204;
	b=vgN8DhQDWqZ0AXbAnmzm9aOQU3tAN6DesrtN8Lyl4f0pwa5BSEKLWCuUmOfCYotRGpHi
	 NTLft260/+tKwSOX5NVrULLCtYO7KoiMx7AV7lHwD/WnGscv2IaZ0xMRpD3TlT2FUADMM
	 cVjV/wtQ0uHYUaDpv7HsLbKIUjsXcN/UW+DTvPITh/fggcYk3LueDYjSCTFKRZ/zNrE20
	 yT97m78EyLRne9JFiTyi7eQrtCXA5mgDjxKdYaOO/BI/1Q1QL6/4Tox/3xYlKzS0sZdk4
	 oVtFLIxfSNGkteIxFqNcr/+SghO6sXfzc3OICQHrxBfm9G4GNw6Qj/00SzBBbzGe6Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794683204;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xhgN+TKQr9ogkPk4QvstdKLafDVYQ/GXO+YrEsAwOSk=;
	b=kuGV/SrgKQmSUbmAttv4J1ju3kA0VskEdh8Vhr3L3dxNTeHQgoyxZ8nTRkki+874c4l6
	 6PgjcQW2OP9hRbQc+raczrhkJdzk32NfYUn7TI8FOUVY9dmUpgPvAaxvCbkT+ga+9agWs
	 t6Zp3bjhMek6QXz9g0SXdy3r4bH5/iRs/1Xzi2ECf/krQcXm7DdDovUeCe9m+sv9WnOyR
	 cviUkFNZh3c4YDwR8nnehtHMakbx4IRba38bxqjXGTmOkaKWDW/Dku2QlB8JuTL5Rnp4d
	 INsmUN7F0Y4UJLhz5FABF78ZPAb5poO1Zb9mU2xoEHQ4/FuQgTtwLFMmqIL60SCltoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=obEvgIzk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D01606A323
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 19:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=obEvgIzk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741EA1F000C4;
	Sat, 14 Nov 2026 19:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794683203;
	bh=xhgN+TKQr9ogkPk4QvstdKLafDVYQ/GXO+YrEsAwOSk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=obEvgIzkxcyIhai3zP8WTcvf1ptDHIbP7GNcVT6DCK0lFhb6KrE9ikux1H9XkLEq1
	 hNlEzbPu5ZOf8XmPH1oXtBbcGLIy3jpPWJerwH/kSVff8tJ2+CfLjwg/FWQxVHANGs
	 X/e/PvcaskVC8L1Empud37/LMzOx03JFc+PdPdatDK21j9+DvmgY6HWMi9iBKvmnTA
	 a8OhXLqYjhjP185W+aG1zQ5rWN+46f0yAyNBLX2A2AuC9C055zycnaJ36RsMGhqR+O
	 nKdQuUtfyITG8uCGBlM+5ny/V29xdVaxJQY6RZINtbxrRz3POo4kFusnnY4sTErlU/
	 whKXoFKTR59Ew==
Message-ID: <sashiko-outbox-214953@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] leds: pca9532: Propagate I2C errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniil Demakov" <t3127430@gmail.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261114185201.30519-1-t3127430@gmail.com>
References: <20261114141926.92737-1-t3127430@gmail.com>
 <20261114185201.30519-1-t3127430@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 19:06:43 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Check return values from SMBus read and write operations and
> propagate errors through LED, PWM, blink and GPIO operations.
>=20
> Restore previous LED and PWM state when hardware updates fail.
> Protect shared LED and PWM state with the update mutex.
>=20
> Check register writes during device initialization and register
> LED class devices only after successfully configuring the hardware.
>=20
> Signed-off-by: Daniil Demakov <t3127430@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114185201.3051=
9-1-t3127430@gmail.com?part=3D1

