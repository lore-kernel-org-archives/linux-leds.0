Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793556196;
	b=2QhYXnKimQ8GAVvVfahAmboiNSadglVe70WlqGVtkOtPn0XrjbCeuawbVDLne7hi8xka
	 kdQvybjsumZKzwrPW06hrDvGEM+Oyp7y5NNWzXgqKtN/Ug7te0ooIHeNzPPdMAtfB/5Uc
	 N252FKF94+GTncolH8OfKbmhjX/0+6RR58ycsiDwZ+f1TsVQDPHjmT6kFELUWEqo5oxad
	 hC2HbNFj5WGQkNnlbHkfNoD53u78bAcWAti0ls7UM0TAKL6qcHf2O9IQJTS7EmuzJ1leJ
	 6W8I9UjE2lHYjTUZ5P0gjYSgwhOzfzq6Suyzwle0ejUjclaZBrgoBdJuG3SfRPbb4aQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793556196;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=eXHwMW4V4v8WMpgUgtwJi5ivKtzvlCeyOpj5yYo5S2Y=;
	b=Pmppxf94sXnZCgk2KS2wotirjY2t3yvR21+PReKfuWq9lTeOOdPFUdW4UvRHKuEJcZ9V
	 OGwdnZHMB65BS4QkQzs2hQwva7DzwaPJm3uY3q9BB30LR0oIpZS0F4gIed4WbIM5K8yjb
	 BWRVVYrFZpwGfPipQixVb+JTmJXKck6AX/FF0U9Fd1qvR6u3vRXI3z3VkfaSbXISFdqMH
	 1vwCp53hxZDWirpeZiu/9S/S7zUuuql0wnq58f2f+32uLqRIdTJa7+GSVSSCEC8OFwRPj
	 vN75Ak1rhbZSxuvPH9N63Qtg692INxYbpPSsLWklglin0GYQT3Hr/nZSoQ0Ennugyug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=mg0iYvul;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AC660A2601;
	Sun,  1 Nov 2026 18:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5AC660A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=mg0iYvul
ARC-Seal: i=1; a=rsa-sha256; t=1793556163; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jMfJx7mtJyvrl3hUMFXapoMuOUV0SW6njFh2wylHXITowpncs3kDe6RSZpctLhPcC9UEhO1QTHht9SG4glxsGPhwsiit30FYux7h73qov0oZbRkoE4u3+sh3V8090mGQMd470smDKWYoM2ceo9TvkH3iOAuvnIZdDf1eEJom+i8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793556163; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eXHwMW4V4v8WMpgUgtwJi5ivKtzvlCeyOpj5yYo5S2Y=; 
	b=XGbUC6+DOYEYYsCfwCgdmiekVba2XSqAjiNBGyrv22DYhE8FP48ze15u/GyHx9YnWc2XOx33wseNndNH6n3ioyuTq1CW1pWAfS8aoh+e146eBqC3JCUyewwXZC/JUYbHI0whcGcbZ6wyjKbZ2TQONP73xYhVptEMsm/TD4SSrF8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=mg0iYvul/EpjF52CrVKwuu2v4fCljaQRbvIOvjnfI8Ue5JzT5rpq++u7Mu8mvopHg3mnDNEVUnxlg7eJ0QWyUUJu9ijeqALN/upZmEMU1yUc6yg90bVkl25Ed5SW01CRJNaG+Q89G2yqUwoTf1XAxQZcKruQhhQEUN3dNqmgDsG0HKWulYx813jotdto6ZzDFbGXOq1UfbLSwaZUtTz8/DFUsGcp4jZCjGCn4fwfzoBZdvH/aphGb6Ak8T7OEs5Ls/rjQkZ6JEAq9LKmgVfwcIFbyFHbIBQLmUCLlcjshXJPu2+sQuApYPM80RvAPPvG9GZD7yugxrQl+NHaxPLVpQ==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=eXHwMW4V4v8WMpgUgtwJi5ivKtzvlCeyOpj5yYo5S2Y=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793556161090217.19737328716076;
	Sun, 1 Nov 2026 10:02:41 -0800 (PST)
Message-ID: <0fd34add2ef37f6abcab1301f6249cc68423f148.camel@rong.moe>
Subject: Re: [RFC PATCH 0/1] platform/x86: thinkpad_acpi: Add support for
 auto keyboard backlight
From: Rong Zhang <i@rong.moe>
To: Qiling Zhu <kmatzkaczor244@gmail.com>, Mark Pearson	
 <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Henrique de Moraes Holschuh	
 <hmh@hmh.eng.br>
Cc: Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar
 <vsankar@lenovo.com>,  Griffin Kroah-Hartman	 <griffin@kroah.com>,
 ibm-acpi-devel@lists.sourceforge.net, Lee Jones	 <lee@kernel.org>,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,  Pavel Machek
 <pavel@kernel.org>, platform-driver-x86@vger.kernel.org,
 vishnuocv@gmail.com, vsankar@lenovo.com
In-Reply-To: <20261101100123.28749-1-kmatzkaczor244@gmail.com>
References: <20261101100123.28749-1-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 01:57:33 +0800
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Qiling,

Thanks for working on this.

On Sun, 2026-11-01 at 18:01 +0800, Qiling Zhu wrote:
> Hi Mark, Ilpo, Rong,
>=20
> Recent ThinkPads with an ambient light sensor (ALS) support an auto
> mode for the keyboard backlight: the EC picks the backlight level
> according to ambient light. The mode is EC keyboard backlight level 3,
> above the two fixed levels exposed so far, and it is reachable only
> through the Fn+Space shortcut, which is handled entirely by the
> firmware. Userspace can neither select the mode nor observe whether it
> is active.
>=20
> This series wires the auto mode up as a private hardware control
> trigger, "tpacpi-kbd-auto", on top of the hw control trigger framework
> that recently landed in mainline [1]. With it:
>=20
>   - selecting the trigger writes EC level 3 (auto mode on); writing
>     "none" turns the backlight off
>   - the trigger state (bracketed in the trigger sysfs attribute, and
>     the new trigger_may_offload_to_hw attribute) is the userspace
>     view of auto mode; reading brightness returns -ENODATA while
>     auto mode is active, per the framework semantics
>   - Fn+Space keeps cycling through levels and auto mode as before,
>     and the trigger state now follows hardware-initiated transitions
>     automatically
>=20
> This is the thinkpad_acpi counterpart of the ideapad-laptop wiring
> from the same framework series, which is still queued; this patch
> depends only on the LED core parts already in mainline and can be
> applied independently.
>=20
> For background: the February discussion settled that auto mode must
> not be exposed as a brightness value [2], but no agreement was
> reached back then on how to expose it instead; the hardware control
> trigger approach was established later by the framework series [1].
>=20
> Tested on a ThinkPad X1 Carbon Gen 14 (MT 21V8) running linux-next
> next-20261030: 61 scripted user-visible assertions covering the
> software paths, the Fn+Space event chain and the unchanged legacy
> behavior, plus manual exercising of both the Fn+Space cycling and
> desktop-environment brightness controls; checkpatch --strict clean.
>=20
> Deliberately unchanged (details in the commit message):
>=20
>   - max_brightness stays 2; auto mode is not multiplexed into the
>     brightness value
>   - writing 3 to /proc/acpi/ibm/kbdlight keeps returning -EINVAL
>   - module unload still turns the keyboard backlight off
>=20
> Two open questions, the main reason for the RFC tag:
>=20
>   1. MLCG returns capability bits in the upper 16 bits; does one of
>      them indicate auto mode support? If yes, I would gate trigger
>      registration on it. Mark, does the EC documentation say?
>   2. On models without an ALS, the EC behavior when asked for level 3
>      via MLCS is unknown to me. If it is undefined rather than
>      rejected, optimistic registration would need a rethink (e.g.
>      DMI whitelisting).
>=20
> Rong, happy to rebase this on top of your series or fold it in, if
> you prefer to keep both wirings together.

(+CC Vishnu)

AFAIK, Vishnu is also working on adding the same support using the hw
control trigger framework. Maybe they can answer your questions or
integrate your patch into theirs.

Thanks,
Rong

>=20
> Comments welcome.
>=20
> Regards,
> Qiling Zhu
>=20
> This patch was developed with LLM assistance; I reviewed every design
> decision against the framework sources and validated the behavior on
> real hardware myself.
>=20
> [1] https://lore.kernel.org/r/20260618-leds-trigger-hw-changed-v2-0-c28c4=
4053cf3@rong.moe/
> [2] https://lore.kernel.org/r/20260203232219.11683-1-vishnuocv@gmail.com/
>=20
> Qiling Zhu (1):
>   platform/x86: thinkpad_acpi: Add support for auto keyboard backlight
>=20
>  drivers/platform/x86/lenovo/Kconfig         |   1 +
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 104 ++++++++++++++++----
>  2 files changed, 88 insertions(+), 17 deletions(-)
