Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679379;
	b=CelmYozaR2kCiaFdt996wP0R7zEI4VExctdD8ErkR87CdbHsxBz9qGMnimCajz3enXdz
	 m19rsyLByzNOeT5BWdq6y+u2PfY2NmCL1p1bt7oIa4Z96OqYrPWkJR14846h6lVlwUggI
	 5ZZl3oceVdV2+AJR2JKP3T2x6xLLqSZAaaZQDEOHJxXIWEZO8PC244cnmMIIjs9GsP3MT
	 c6kCTj18SnOdBjscs0CRWf4/X1XRhrfuDC3mgaC9K8rgBypyLa7jyrt32ulLO2JbSiBzX
	 lsIV5pl9mJn90OZYCs7RN8r+4Wl5j+Dm1Q41vG4j63p+qMr7jJDag8LQ+Vhj0TWZItg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679379;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RUfOJpnNls/r+XMOkiOpnwWHBUVirl+gc1rDRvZGpFw=;
	b=sg5eT49FzgfllUasJzlxsXu9gSqI3kvlN7c0htDKzOT4HhI/uIKnOFw+yERn1YRviwPt
	 pOpIzu4u9RhMub29mzrJUVcbpRUQ10yTVsextyp16S1oT+szS4q8ZxJOMtiMlBLmwwe/b
	 W/yaqJRFLwpf9SShip8XnyXe1qeKzTDv/8EnxUwXPDVCyaY4yNh4kzCfbZPEgY+xfII+L
	 t5ri/dgtfSF/frvbrc9tJ+qEgOkTL7yXwAmJJzKrx4tSkKrGkP8Vcwa46vUn8UndG+e1e
	 CQzSwP/ak/vrw0TdJ2wqatgMY4vQgb9wnFQKlUFqZgYhlJBAFsA3SnOO3H4I/LzokMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YvFhL5AW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2AC606A323
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 18:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YvFhL5AW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0CE1F000C4;
	Sat, 14 Nov 2026 18:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794679378;
	bh=RUfOJpnNls/r+XMOkiOpnwWHBUVirl+gc1rDRvZGpFw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YvFhL5AWeP3u4qffmKD7yG+wL9+pEsQ4wnLNnysxEZvf0zjTGAVgxku/vfaQcHrx9
	 zeRoD7e108g8LhnjED6vW2BjsHA7wjW0APDp3GHS+5qTnefd1eLerV7fvKIt+Y8bt3
	 Mml5tItshpRPe+Z5CVviQo9fZXXyJUWY5XxYk5XdtNPhIZmLofhcQNj7daSFMOUBjb
	 VQr0OHNqjVMSD/cE2ULOyMBcH3YiwhyQRMjtlR283n+Ib/XwW/e5pejmbtmazTdFC7
	 cSyuRrA8BwuZ3JEEIGcizMbtG1/LkQH09P67L689e6Djc3tgjvmQmeg2LfYMuvt7J6
	 IzCIWGkpwU+hQ==
Message-ID: <sashiko-outbox-214867@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/7] platform/x86: thinkpad_acpi: Detect auto-mode
 capability via MLCG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiling Zhu" <kmatzkaczor244@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261114174814.62153-5-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-5-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 18:02:57 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> The upper bits of the MLCG return value carry capability information.
> Bit 20 indicates whether the EC supports the auto mode of the keyboard
> backlight (0 =3D manual levels only, 1 =3D auto mode available), as defin=
ed
> by the firmware.
>=20
> Record it in tp_features.kbdlight_auto, in preparation for using it to
> gate the auto-mode trigger registration and the LED suspend/resume
> skipping in subsequent changes.
>=20
> Link: https://lore.kernel.org/r/CABxCQKuEP5wMSstO0MK1MhaqXTKrPhUSN3V2mrE_=
42j4cXsXZQ@mail.gmail.com
> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114174814.6215=
3-1-kmatzkaczor244@gmail.com?part=3D4

