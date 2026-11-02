Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632594;
	b=3iEEPAOsrs1laUQZye9eLXb/oMfPcwIAlrQhzfJGGYYB+tRCEqZfppjaBzcpgNtRjjYi
	 5v0hcnRcVjjMsRpUC1/a7Q6jUXRcztara9FWE9DDMNRxnG9sDkoVp5mysJfMyCO9dI3g+
	 XrS2i1nd9AfwCrsfe79IKDTowm+6WVNn2Rv1+K9rauIrDGrLm5dOPNU0lHqYNJVocOhI4
	 JsgquEKnM14wRv7Wv/64tiJep8phZGXpkrp/2QsGCX3Pj+TvTnRWLQH78jNQHcfRkd60+
	 aj4qSrpHdyEsL3mdfQS/QZ3r+ZBisyi2brWW1kgGAjDq3MR0e7Z3aDHGtrz6pCQqY4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632594;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uMcqpc9paaKl+tDq3Fejd3Qp2XtAwrSFxCQRn+pqxSo=;
	b=C1UejLf2XvpNaPdMlI9WwsllAkOYb3fH7GMFT6UILr78LJ1zpTc0ZakY6vwBT2l9Z2NT
	 U4PDSgcsWj86NPVIPy9dhU+IzvnWYIQVP445tBhdKx/R0uTwep0Sn/eSvS7wGR6X/ynDY
	 ucyeO8TVBHPhAp6J5yX0AlUJWs1jhfvogESvlBc7zeYn7rfHGE5/KyixVi4RX4jX+cDYX
	 mUM1I9zI4H6OJDRtWYUwUgARHI7+m9OhnL21Vj2a57aTX4+H7S/gWBPa+/53irk7Wyqwy
	 aN2fK7m1Wd4ztRviEThcs06b+lIw2KiSOEPXvOqH85S1mFpqOamhfxaVxWOfwixkZ9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bbohE6AU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C890260BA902
	for <linux-leds@vger.kernel.org>; Mon,  2 Nov 2026 15:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bbohE6AU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457F51F00A16;
	Mon,  2 Nov 2026 15:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632593;
	bh=uMcqpc9paaKl+tDq3Fejd3Qp2XtAwrSFxCQRn+pqxSo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bbohE6AUxtiRp5uyXePzAOj4CMUGgqyJGfwbSgh5lSyvfZRWs2pdISukBiCxaRKiW
	 jmausz8a2NKnovKsuIT3vhe4cmaPxAImAPfQFIytiYkImUrkHhAzHXBJLBstdrGLyQ
	 fd1Yc821asHmVlBNIRLuw13Hfdhk3kHn6rBfzSjpSDoI7qmX32EOlyGsmAzsb5Gw4o
	 7Gn5CFLO7jZZt9RcbTnIw0ze6GuraB4FX+ik3YawwryHHKm+p4dhhxZJDT9jURHg/N
	 O5GrPrQ/Qwc/jgCT+1Z0KSRqa1qP4B8mskRmSNuf660RJg0K7qWR93XCBrRghk8OsO
	 PBvjhZSKTMWSQ==
Message-ID: <sashiko-outbox-193647@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2 1/2] platform/x86: thinkpad_acpi: Extract
 kbdlight_notify_change() helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiling Zhu" <kmatzkaczor244@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261102151211.40701-2-kmatzkaczor244@gmail.com>
References: <20261101100123.28749-1-kmatzkaczor244@gmail.com>
 <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261102151211.40701-2-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 15:16:32 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> TP_HKEY_EV_KBD_LIGHT handling in tpacpi_driver_event() reads back the EC
> level, updates the cached brightness and notifies the LED core inline.
> Extract this block into a separate kbdlight_notify_change() helper, in
> preparation for reusing it in further changes.
>=20
> No functional change intended.
>=20
> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102151211.4070=
1-1-kmatzkaczor244@gmail.com?part=3D1

