Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793643573;
	b=U+PuAjuKms8E4oWo21HVu3bcyv5KbnpFW1QheMUjsCnXGy9P5bRupYRAIqu24QrMbpPT
	 yIuTDYXM/OB2QSGH3IP/F03R083+bwPk8bSCj8QWu6fZCc92+9SO4G3vE9t6JAfuB3xDD
	 EbnJbY37QQSGpTx1y6ao4A+tjypwHzbWyQ792ViT4wp8eN/tFZN5CiYYzeU+ghnhsghWG
	 I8yW/xRSwh1VBxvOM2DcxVh3pDf01uq7pKba4Cr/c2nEmnOIS1IDM0AgEcTA0Gv7sD9+Y
	 hQHCxU4kNwXctRTgUaQZtecoGqBybDC9WxsVCJTVHlj1IrmBAqHuOyy1/7l1Y81hpQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643573;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=jnrpWo/1k3ciop1RwuuOGAdzFMo6kbFNnV7QoPWs5n8=;
	b=B5FoHNiW2MVQcMSAy6p2HBUDYNMZ9C2LTxtFvOHrOspD9IEMFj5/bvLFWD8UzfFAL21z
	 TkNV+0fuzc0HsF8bnuUxqBknMOmbfpSiC0VGrYeJA5e6vOX8Z4qtyeKDfUNZCsiHNYkpX
	 Og3+DKaD4dKORU0m7tWzL/uU6dyZanjm8v4rv4Un1pGbg3X4VGNvy2w9/6Zyf/Nwvx83h
	 x1Wn7SSsjIECuqbXT2DGCjNKXW92M40BlmReldr146BX+mbHkfqsypUu0TxfnZGW+oDkz
	 dp9GH6hd6LnIAC4chxbw6xOGFjWIuE/S50CCA3PC7jiqeGzufQKYa04wHZBHCqWbbzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=W0qlPxcH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC052606D810;
	Mon,  2 Nov 2026 18:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC052606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=W0qlPxcH
ARC-Seal: i=1; a=rsa-sha256; t=1793643544; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GZMzWCHiJfYQa0fx4cqKgXRnvcNzfYwlEQ6AogyvfoN+TCC3D313maJBxv5CR7SiXinGP9/5Cf5xv7KKxeBqrOepVqISHpgWKjZn71v0Ttd5vL/yTf1vpEvjDvejKOFrjmXQHGRO4NWpMSqFaKBtr/q+Ge0HJRJZEW3t2QxoRhI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793643544; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jnrpWo/1k3ciop1RwuuOGAdzFMo6kbFNnV7QoPWs5n8=; 
	b=iyMbGwwzJs+29Yjo6cA1kbKsfFoUn6HsAMUVQihRdYDciLxtQIKGJ0vq46ysoB5QunWiAsU3i+ZS95TRH0pXYIinyiv/Y0k0oYg3hVA8Ohsugrhhqqi4gZFa9HYQtxIRzxnnSNWT3Yyo/GkC0hLHhlf7pY4yMwWHUbelN5Bl+J0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=W0qlPxcHPXZg18GTrVr9ozLsQdewcnwBB/a73g/YJgPZ6MYimm1Dvp5HZw8wpE01DSVM/vRXv8i5S4Z00MXo+zUrlXZFZ+hSBaePi+O79t56uqXNIm2LjJD6hkntRo8BTT0K3fNn8JAMyka9Go2oSyiU+cpU7IBLZL55o2W/JiaUbmHfiVC+X64A/DnwSuYsnwKfdsV7Lvn1gB/8ajyXL+7H6EOry3TOg29lMBkHG5up12+yGWTKAA2mbMtF13hF/sCuADv8Sf8y89pkuNiMV8Q0aOjux97rAvEsYHwyVO8QODn/oE9JkVVueLzzuO+vYoohSpHcBaOjhsT2FcIdCw==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=jnrpWo/1k3ciop1RwuuOGAdzFMo6kbFNnV7QoPWs5n8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793643541400173.10316889742307;
	Mon, 2 Nov 2026 10:19:01 -0800 (PST)
Message-ID: <c1bfa5151bbe73977725305613842f94616a8dbb.camel@rong.moe>
Subject: Re: [RFC PATCH v2 0/2] Add support for auto keyboard backlight
From: Rong Zhang <i@rong.moe>
To: Qiling Zhu <kmatzkaczor244@gmail.com>, Mark Pearson	
 <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Henrique de Moraes Holschuh	
 <hmh@hmh.eng.br>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>, 
	ibm-acpi-devel@lists.sourceforge.net, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Pavel Machek	
 <pavel@kernel.org>, platform-driver-x86@vger.kernel.org,
 vishnuocv@gmail.com, 	vsankar@lenovo.com
In-Reply-To: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
References: <20261101100123.28749-1-kmatzkaczor244@gmail.com>
		 <20261102151211.40701-1-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 02:13:55 +0800
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-2 
X-ZohoMailClient: External

Hi Qiling,

On Mon, 2026-11-02 at 23:10 +0800, Qiling Zhu wrote:
> Hi Mark, Rong, Ilpo,
>=20
> Thanks for the review comments on v1. This v2 addresses them and is
> now split into a pure refactor (1/2) and the feature addition (2/2),
> as requested.

You don't need to refresh the series in a hurry, unless you've got enough
reviews or may miss the cycle. Asking an LLM agent to refresh the series
is easy, but a human being needs time to review your series.

Please leave some time for others to respond.

>=20
> Summary of the changes:
>=20
> * Kconfig: the "depends on LEDS_TRIGGERS_HW_CHANGED" is gone. While
>   at it I also added a "select LEDS_TRIGGERS": without it the trigger
>   helpers become no-op stubs and the whole feature would silently
>   disappear in configurations that don't opt into LEDS_TRIGGERS,
>   which seemed worse than a small select. HW_CHANGED support stays
>   optional; without it the trigger still works, only the
>   hardware-initiated transitions are not reported. The select goes
>   beyond what was suggested, so please let me know if you'd rather
>   drop it.
>=20
> * The auto mode is never reported to the LED core as level 3: a
>   single helper maps it to a brightness of 0, used by both
>   brightness_get and the brightness_hw_changed notification, so
>   level 3 has no path into the LED core at all. Internal state
>   tracking compares raw EC levels.
>=20
> * Writing a regular level through /proc/acpi/ibm/kbdlight now drops
>   the trigger when leaving auto mode. Instead of raising the
>   hardware-control notification and letting the worker handle it, I
>   went through the same path brightness_store() uses: drop the
>   trigger and hand the new level to the LED core, which applies it
>   after the LED_OFF queued by dropping the trigger. That way proc
>   and sysfs behave alike.
>=20
> * suspend/resume no longer touch the LED while auto mode is active
>   (v1 would have restored brightness 2 there and left the trigger
>   state inconsistent, as Rong pointed out =E2=80=94 thank you). The LED c=
ore
>   is now kept out of suspend entirely in auto mode; resume just
>   re-reads the EC level and reconciles. My reasoning is that in auto
>   mode the EC owns the backlight, so the driver should not make
>   decisions on its behalf =E2=80=94 the firmware already turns the backli=
ght
>   off for suspend and restores it on resume by itself. This is based
>   on observing my own machine (s2idle), so I may be wrong about
>   other models. The non-auto paths are unchanged: suspend still
>   turns the backlight off and resume still restores the previous
>   level.

If the firmware properly handles it when hw brightness !=3D 3, you can skip
led_classdev_{suspend,resume}() completely as long as the device supports
auto mode. They are only needed when the firmware doesn't take care of
the keyboard backlight. Skipping them should make our life mush easier.

Of course, we still need an approach to determine the support. That's why
we should leave some time for Vishnu and Mark to answer the question.

>=20
> One thing Sashiko (the Linux Foundation's AI review system)
> brought up in its review of v1, and which I then verified in the
> code, seems worth raising here: led_trigger_hw_control_changed_worker()
> reads the transition flag before acquiring the LED's trigger_lock,
> and the read and the transition are not atomic. If, while a worker
> carrying "deactivate" is still on its way, userspace re-selects the
> private trigger, the worker then drops the trigger that userspace
> just set, and no further event arrives to reconcile the state.
> I haven't reliably reproduced this, but the window looks real, and
> the ideapad wiring seems equally exposed. My feeling is that this
> would be better addressed in the trigger core than worked around in
> each driver, but I may be missing something =E2=80=94 Rong, I'd appreciat=
e
> your thoughts.

It is an unfortunate side-effect of the workqueue deferral mechanism.=C2=A0=
The
mechanism was introduced in order that:

- the LED driver can notify hw control change in an atomic context
- the LED driver can properly serialize notification handling, trigger
[de]activation, brightness_set[_blocking]() and hw_offloaded() callback
without worrying about lock reentrance

As for ideapad-laptop, it needs the second guarantee, as all said
functions or callbacks need to acquire the same mutex to prevent TOCTOU
issues.

IMHO the race condition is not a big deal. The interface was designed
with an assumption: it's the user who decides to press the shortcut
(Fn+Space) and/or select the trigger via sysfs. It can only be barely
reproduced in fuzz tests with scripts and robotic fingers, which is as
boring as fuzzing the bind/unbind interface to stress naive drivers...

That being said, I am thinking of working around this by querying
hw_offloaded() in the worker. I will find some time to prepare a patch to
see if the approach works and submit it. It won't change the interface,
so patches can be applied in an arbitrary order. Please ignore the issue
for the time being (OTOH, you don't need to rebase on top of the said
patch when it's ready).

Thanks,
Rong

>=20
> A few observations that may be useful for the discussion:
>=20
> * I disassembled the DSDT and instrumented the driver to see what
>   MLCS returns: it is the EC status word, and bit 31 looks like an
>   error flag =E2=80=94 the DSDT skips the hotkey event when it is set. On=
 my
>   machine it reads 0 for all levels, with no level echo, and the
>   error path is not reachable. That is why activation verifies with a
>   read-back rather than the return value.
>=20
> * The 0x1012 event is raised by the DSDT itself: MLCS issues it when
>   the write succeeded, the level actually changed, and the hotkey is
>   not masked. This explains why driver-initiated writes also see the
>   event and why rewriting the same level doesn't.
>=20
> * The Fn+Space cycle order on this machine is 0 -> 3 -> 1 -> 2 -> 0,
>   confirmed by testing; sharing in case it is useful for comparison
>   across models. Nothing in the code or tests relies on it.
>=20
> An open question from v1 that I'm still unsure about: on models
> without an ALS the auto mode presumably doesn't exist =E2=80=94 how shoul=
d
> the driver handle that? Mark, do you know what the EC does when
> asked for level 3 on such machines, and whether there is a reliable
> way to tell at probe time whether auto mode is supported? For now
> the trigger is registered unconditionally on keyboard-backlight-
> capable machines.
>=20
> Vishnu, Rong mentioned in the v1 discussion that you are also working
> on the same support using the hw control trigger framework =E2=80=94 how =
is
> that going? If you have answers to the questions above, or if there
> is a chance to combine the two efforts, I'd be happy to coordinate.
>=20
> Tested on the same ThinkPad X1 Carbon Gen 14 (linux-next
> next-20261030) with targeted tests and on-hardware verification of
> the affected paths, including suspend/resume; checkpatch --strict
> clean.
>=20
> Regards,
> Qiling Zhu
>=20
> This patch was developed with LLM assistance; I reviewed every design
> decision against the framework sources and validated the behavior on
> real hardware myself.
>=20
> Qiling Zhu (2):
>   platform/x86: thinkpad_acpi: Extract kbdlight_notify_change() helper
>   platform/x86: thinkpad_acpi: Add support for auto keyboard backlight
>=20
>  drivers/platform/x86/lenovo/Kconfig         |   1 +
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 179 +++++++++++++++++---
>  2 files changed, 159 insertions(+), 21 deletions(-)
