Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679220;
	b=JYXK/rUjpLIDTkFqewU5MyBg3ZOsQvQPgcVe8WyVS/Pdq9t8bcFei3ODiet5KuQbKAYa
	 rNsp94GigtIheSK68RX4U/JARhK5Jvg/EOD7/GSYGpY0xpMppaf6X7f/nhbPLmMNWVc+u
	 oUjJoWZSqdO8rRxXULXauGwdV9dc07fza+bfd7jXHqE3QYq25ACfZC7eK4WjOL+gwBJnh
	 rNZYzt9bTgQ36nFlGL8eRtuQVM/naDU78ptk5aXBGS44t8VVZi/Bdl/YTL3E+lQfnBYcN
	 PlU9mURdGSHD1ra1jiqAxYdWCwvRWEvJvR7yiXUcXRJkl2EkJuvKSllAb+3LMyiNSlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679220;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ARlFR/45+KtOteIRmg87KCvdzOBQDdgaKd3NalzQY0A=;
	b=at1zpxr2woVDfYB67gv6Ae8VQIJFccE0wzpOuR8KedWwg//Rfcq70NewV1mlmzvskIrr
	 Y0ZLviNWI4J7KaGLg9ktYA0m1T4ywhheoZR2y+GUGUJyn0SQ6NiVkquGDHt18j/PUO+jO
	 +CxgNv/EvbHBlC1MbCa+akZfx3uirMjKzkCpOSuj5TWufpSy0mt4Hi5LK2M5op9NsiFxG
	 KTyvm/UOR6ZLrFo+Up8ZGIV0UvPCQbrg8d/dvxdtJ/nWLGfMSuLu2dsMWNez0uFv0C/hW
	 cf9Ju0qt6SEHYvu6p5o9r0X1HdtESK8T13DeXAL2KvxF3i15H690/WlR0V7HdgYatMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VzwQ9BJP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FE7606A327
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 18:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VzwQ9BJP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1311F000C4;
	Sat, 14 Nov 2026 18:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794679219;
	bh=ARlFR/45+KtOteIRmg87KCvdzOBQDdgaKd3NalzQY0A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VzwQ9BJPV+WTIGpraxJ5jpKbvSh1FdHXl+9PNp0TdTcwzRWBvgwO1vdQdwtCyz4gm
	 +4SIzBxESYr3UF19gxXc3wwKn0VOBpRhYIR0r+GOhX0LVf5B93H4URMuxqrJW3JE+r
	 fWDze2Mme/rcOYFBw6IrH/EGKdzrs8ktpfbOWKeIMwzycGwlveDlZ8lKcFtPM3Aq8Q
	 pYs0Y59vxhK5yGA3RHrcCH1k3xcLYhmVdnTuqX7KLc4QIyiM0zNP+qhWI0HRpJFZeH
	 FUh2KPoIfWtC++ljnhWamHiuvRo8VgO/8grVHXFViqW1Wht6VawxwzT4jyCLxj117B
	 e+72pUgBfD6RA==
Message-ID: <sashiko-outbox-214864@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/7] platform/x86: thinkpad_acpi: Extract
 kbdlight_notify_change() helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiling Zhu" <kmatzkaczor244@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261114174814.62153-3-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-3-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 18:00:19 +0000
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
> Extract this block into separate kbdlight_notify_level() and
> kbdlight_notify_change() helpers, in preparation for reusing the former
> when writing a level through the proc interface in a subsequent change.
>=20
> kbdlight_notify_level() expects the caller to hold kbdlight_mutex;
> kbdlight_notify_change() queries the EC and notifies under the same
> mutex, like the original inline code did.
>=20
> No functional change intended.
>=20
> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114174814.6215=
3-1-kmatzkaczor244@gmail.com?part=3D2

