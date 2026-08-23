Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EDB3126D6;
	Sun, 23 Aug 2026 16:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787503639; cv=none; b=vCXD5MsPkcBM/MzZxi/2G1Fadit25vtxIKLWGf34/byRd1Y4nx3hZKz4DiNB4scKTgBqdtHiN7/qqeni0Du+Uobvl1sB7906N5Rl+wXqNHRrnM2rMee6UDr0tSJKP5twhpEUTR8HrXa1Ry+/P32v5/8jkHNDEn/yl6yAuyLG3cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787503639; c=relaxed/simple;
	bh=c8Jpa0SzYKcAyjDOJQXLOcgcvL8AGwWNqyy+9gjfW9U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j0+Ix4miDtgTm5Hpi9zcTiAhfqmP/B9DiFSmIv+vl/jUeNXVOOUVveCRGqAJ1mfXOdUzDFvR0oz6tPb6uw05kW8AccH7IWOMC8MJy9Qm/t86jM8DVoXxv1LVARhVgKGTVxkuDuMBQYz89FPB08q6cs8uYisturI1gJu2p3VkRNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCvz2ze2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCvz2ze2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FAB1F00A3A;
	Sun, 23 Aug 2026 16:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787503638;
	bh=c8Jpa0SzYKcAyjDOJQXLOcgcvL8AGwWNqyy+9gjfW9U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XCvz2ze2ECEXGdiMwhZ32R4J89pL2Ot0mfSyfds8t3JCIcpJQLdrAYTPZphmSxYFV
	 rC7GWoTPMCK1dK1npyV0X92Nl8ElznrV4QUaQENN/2Po2ZYRW6fb9lsElnLKoIuD53
	 L9UI/8RafmLwubHyJZLqdd2oCTjME0iIB8jkzWj+nhADgJZcRoX2y9EU/Ve6XAo7N7
	 zJR5PihzSnvArlIMF+Hrq58HKOkTh8DRpJP6aVWra7s7Qo7XYppRaImBXvZpYRfNKZ
	 wBFH7SRNhDRiRv93zx2stWFbQPYTuqUQlxD2G0x2iXniuS8H3/iuqu6U/vcQFsDeiZ
	 ekx875CeoZIMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] leds: is32fl3207: Add controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <f04b85bbf71a09f372b1f248dbd2b1286a0ba903.1787502624.git.ahmadexp@gmail.com>
References: <cover.1787502624.git.ahmadexp@gmail.com>
 <f04b85bbf71a09f372b1f248dbd2b1286a0ba903.1787502624.git.ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 16:47:17 +0000
Message-Id: <20260823164718.13FAB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Add an I2C driver for the Lumissil IS32FL3207 18-channel LED controller.
>=20
> Expose individual and multicolor LEDs through the LED class. Use the
> default 8-bit, 62 kHz PWM mode, derive output current from RISET, and
> enforce each output current limit with the scaling registers. Serialize
> multicolor calculation, scaling, PWM, and controller-wide update
> operations.
>=20
> Clear retained scaling while SDB holds the outputs disabled. Release SDB
> and briefly enable normal operation to issue the required software reset,
> then keep the controller in software shutdown while registering every LED.
> Enable outputs only after all limits and initial brightness values are
> programmed.
>=20
> Handle an optional supply and enable GPIO. Serialize shutdown against
> pending brightness updates and honor retained shutdown state.
>=20
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787502624.gi=
t.ahmadexp@gmail.com?part=3D2

