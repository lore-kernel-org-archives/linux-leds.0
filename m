Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793768286;
	b=SnRNkSVEU60vW27E9DltD+Zs1T5ILIh6ZVu89hDoi/4Dn6go30Rq6YeMXYAclgVWDN7l
	 Y3k66bVM2cOwK3BcJiyZs3B6zGko5QPj9jFLADkSJP9rLmKBfNKEhsGgq0//Nkp74C3Rg
	 4kwhfNTpqR6pOlutCqO0tfMaCQGK5f7N/62NyiX+blWuN52gm8z3K4QzSNSLCnbkleq5g
	 F/0CujgQez5Zpfnf0/05jUsaERCnGUpfZacAf1IndLXHJiY4vZQ08lH7timRwuiZbrKAY
	 7DHldEtWQMIP5TutOvNBqtvKFBoGqgkrnj6rIU7/6jGFBNbO0Dhg4AoChRNHwWsNcFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0aDgXyx92m6oxwBS90QVXO0lRfEybhxg9dZAZMkxcDY=;
	b=3nGDeq2wUwKqCauskyhc3FTKkK5XxwBfujf5oR/gRvn43G6MakCTT3LhI9m2BoP7absr
	 Lyzhn60cJhvFny+pCFtVv2WEPuDtZGZ9HsDrLNVH6XWhRhLS+lgVqhDqCkyewFkgFpjrD
	 oJsr32Np6e4d04OcNpF3QOHlpxYDqw9bQCxC/gaFVbXw/ER7AMSNYbjMdBre7tY568jYR
	 D21O3faVlTiWNhjB0F1eW57WdTQHzrpa3E7VTyrpRpluxHFv+vMf9upeTIidnfDFISAtK
	 MAvoc2dyWR9urTk8h6Dg5cK8gTPoOK7+B7nYsfDcHPPsx9c/aIbOx8fnblH+vIuC0bQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xZt4RGI0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BE6606A32E
	for <linux-leds@vger.kernel.org>; Wed,  4 Nov 2026 04:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66BE6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xZt4RGI0
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab4354db11so2700221fa.1
        for <linux-leds@vger.kernel.org>; Tue, 03 Nov 2026 20:58:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793768285; cv=none;
        d=google.com; s=arc-20260327;
        b=GbyfkgEJHrX7fNmVNOHqdbPy+Pi1/QKMpvx6YDToRsjmg3kA8Sp/y+nW3MHev3KRIj
         E1x0aNJ1dHRfmFLWviJE7G+dBHDbb5SsrMBLg0OuGXcHD0CThQ8RWt10MeZGl3xqQCIC
         pj36FUrRovErDlyk0W8uW4IzqIZeXmFBP7cs7T/qXostQHW1gtyj892QkzvGBUwqAKXS
         3rnVVO9jmZp+BfCBktd5rZOLO/OFOGy6QXi8ZA/9w96bpuPdwIQk5DpXqxftvBo4QNH9
         HrBS1MRvZQdMJezkotkmSm6hB8gft3s3zs7+rrPUNnDMkNiA68ve7amFT6fy7pna8vV3
         2fyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0aDgXyx92m6oxwBS90QVXO0lRfEybhxg9dZAZMkxcDY=;
        fh=SVBKiGh0VzAAIcDPjWA28A0/0c/HEOdN008yUn2m8Gg=;
        b=Ht313GI7h0ArecIZXwVYuf7bfzXHiPVeelqqZEAAQYxePAwxJbt9FTQ1/IRLHb6unn
         UCVS859yR80sNqce0CskHqJAEoQGJq6ZNGVwkQEiPzW3jpiNYqhpayyBKSi8LCK41J/g
         W+susNEKzadCZv/3hW5OKdHliCGJx7OGNvNXiHnURK2gEw5ofyhhWAz0vOZIEsWRHVBD
         eF4k67eyh/k01kNRCIOCK2NKWs4ETf2EnVuwAcDR6bd3P1gt1dTiGCQmdeRy0AMEfLFz
         TGruTria7DmwJrXd5Rfa0qqz1L+o64aJg0piYb+9AC5iNfz8QjeQMvJftWd6vibdefGO
         uUsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793768285; x=1794373085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0aDgXyx92m6oxwBS90QVXO0lRfEybhxg9dZAZMkxcDY=;
        b=xZt4RGI0wmKNPn/0giRZMkOsILeQbI9sYIWW+6D4sc3WqD62sW15KYTbCsWML30g27
         7B7DSYIpgdqi8reBQw/QeD09g2qUJNOaOOSXMAB4nzKR4HW5brezxtFcybmUdDwjsatZ
         iNdBHdm38DhqneltuHMCDK8htY5oft/K5gRAIiDGjyL+KuhqB2QhfZqCs4Qw5JkAO4Tc
         yqhoSeZXHChtLlSBtm+59/q4Pdna2Y+UG0Pn3JypnK2E56/qhozkV3WhQAKW3rH5j6Mj
         +apfhkbNLtOyi8T1JlpCq1JjBTr9g4v6jS9kU87oupV6WqaFQKRZX8svYsXhwsA+lYeI
         rkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793768285; x=1794373085;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0aDgXyx92m6oxwBS90QVXO0lRfEybhxg9dZAZMkxcDY=;
        b=k+ABXXngs/jkbFZoz70YQdHtzvhxAEm9Gwl9j6jtb4JUcVYtUBn0h03W5Iyc+KIzhG
         1csjaL2FxybAOxvbFGhxjfCwtiPbGkwo/CbXasMKoA/Z2pLYT1UHZ4AOgHwMEBe3kFqp
         vyPkSokXRP2XCuw4zdrE3Np14WBOdOBfUkT6KCGmyb/tm7nGgjYU4MnBA/3fz8uj4CqI
         JPldNrH1AH/A7KakYMY/VbMBj3xAzwZ+3Cb8ioTQ3siNLwaOzSN/Skt1GNUL/lGtoqAT
         zNnF52ommfotgRep2uHhsxpqNL0Crldht8hXyi6jijelqqwHuyBfc5LeygfpiVrZbX0d
         nzHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlntP/6v7A+1hkU7IMFMntd/BPvkZxwPdXxJdLOzOA+m7rpzLNNwTkb5ualIGm6P+5lfYrSPLXdI50@vger.kernel.org
X-Gm-Message-State: APuU4Z8xqU1Uf58Nu94xS1THhRYCr6vKkGZbYuL4nDiHZWoXVTAVn9pi
	3t6E7RepHvDABreBlhB4tAsXva5Wvzz3GpgzdYuQ77Vs6zNAGyuloIk2FC98CaDKm0qZBM1mbEL
	UDtgXpuC010LxqtPNzBgDqcCuRdEo2zg=
X-Gm-Gg: AYBFou2wX9DfQYG3L6re0Ur/ZBXCOsRfVWovRiaDAZ45OizDk1RgFKPi3HpD0XdJ+lu
	mxPURFGFap910kRqYrz7iaRZjaHYG9qfFEElByMaDyY1JhSw0FFLqHqbuKq3m5j1MhZCRG2ppXH
	VNg+yJRAkz5gcZloJZ8DQoRGwxdhHRm5W0DyDLAJQ1aNTv/EN8zT2oSl5ywoKZVwHswm3y6YljD
	VAXQDvRx6p0sdiVGZ8Nu/Fp6pKrZwOiWEqBBIQGKyBAkOpvfMjVjdEShtHZ2AtIHoBH1B0KdHMw
	UyieUNewusm2jV+f+X66nxuIaPLqaT5HK10pI7IVEgt46IDuh2xVvHkCOGFGuJRGBSs3Pa5vRUF
	YEKpFSFQuO7jhbdXCiE2NCL9yajJzkiu5riowvp7E5ys/vnH2TPPIWfjcJ84doUrbA/KqcDeMvb
	95U+bwUtnlmiTJQvSqGzWMuKcXHQ==
X-Received: by 2002:a2e:a809:0:b0:3ab:4a7c:7a65 with SMTP id
 38308e7fff4ca-3acb7883d20mr31770521fa.0.1793768284322; Tue, 03 Nov 2026
 20:58:04 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101100123.28749-1-kmatzkaczor244@gmail.com> <0fd34add2ef37f6abcab1301f6249cc68423f148.camel@rong.moe>
In-Reply-To: <0fd34add2ef37f6abcab1301f6249cc68423f148.camel@rong.moe>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Wed, 4 Nov 2026 13:57:27 +0900
X-Gm-Features: AclHuK8XI3VQRpfw0chUuAyxMsM8xfvTXW0qniK64dMt65nJY0lDbNTFE4uQ3p0
Message-ID: <CABxCQKuEP5wMSstO0MK1MhaqXTKrPhUSN3V2mrE_42j4cXsXZQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] platform/x86: thinkpad_acpi: Add support for auto
 keyboard backlight
To: Rong Zhang <i@rong.moe>
Cc: Qiling Zhu <kmatzkaczor244@gmail.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Vishnu Sankar <vsankar@lenovo.com>, 
	Griffin Kroah-Hartman <griffin@kroah.com>, ibm-acpi-devel@lists.sourceforge.net, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	Pavel Machek <pavel@kernel.org>, platform-driver-x86@vger.kernel.org, cchen50@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Qiling,

Thanks a lot for the patches.


On Mon, Nov 2, 2026 at 3:02=E2=80=AFAM Rong Zhang <i@rong.moe> wrote:
>
> Hi Qiling,
>
> Thanks for working on this.
>
> On Sun, 2026-11-01 at 18:01 +0800, Qiling Zhu wrote:
> > Hi Mark, Ilpo, Rong,
> >
> > Recent ThinkPads with an ambient light sensor (ALS) support an auto
> > mode for the keyboard backlight: the EC picks the backlight level
> > according to ambient light. The mode is EC keyboard backlight level 3,
> > above the two fixed levels exposed so far, and it is reachable only
> > through the Fn+Space shortcut, which is handled entirely by the
> > firmware. Userspace can neither select the mode nor observe whether it
> > is active.
> >
> > This series wires the auto mode up as a private hardware control
> > trigger, "tpacpi-kbd-auto", on top of the hw control trigger framework
> > that recently landed in mainline [1]. With it:
> >
> >   - selecting the trigger writes EC level 3 (auto mode on); writing
> >     "none" turns the backlight off
> >   - the trigger state (bracketed in the trigger sysfs attribute, and
> >     the new trigger_may_offload_to_hw attribute) is the userspace
> >     view of auto mode; reading brightness returns -ENODATA while
> >     auto mode is active, per the framework semantics
> >   - Fn+Space keeps cycling through levels and auto mode as before,
> >     and the trigger state now follows hardware-initiated transitions
> >     automatically
> >
> > This is the thinkpad_acpi counterpart of the ideapad-laptop wiring
> > from the same framework series, which is still queued; this patch
> > depends only on the LED core parts already in mainline and can be
> > applied independently.
> >
> > For background: the February discussion settled that auto mode must
> > not be exposed as a brightness value [2], but no agreement was
> > reached back then on how to expose it instead; the hardware control
> > trigger approach was established later by the framework series [1].
> >
> > Tested on a ThinkPad X1 Carbon Gen 14 (MT 21V8) running linux-next
> > next-20261030: 61 scripted user-visible assertions covering the
> > software paths, the Fn+Space event chain and the unchanged legacy
> > behavior, plus manual exercising of both the Fn+Space cycling and
> > desktop-environment brightness controls; checkpatch --strict clean.
> >
> > Deliberately unchanged (details in the commit message):
> >
> >   - max_brightness stays 2; auto mode is not multiplexed into the
> >     brightness value
> >   - writing 3 to /proc/acpi/ibm/kbdlight keeps returning -EINVAL
> >   - module unload still turns the keyboard backlight off
> >
> > Two open questions, the main reason for the RFC tag:
> >
> >   1. MLCG returns capability bits in the upper 16 bits; does one of
> >      them indicate auto mode support? If yes, I would gate trigger
> >      registration on it. Mark, does the EC documentation say?
> >   2. On models without an ALS, the EC behavior when asked for level 3
> >      via MLCS is unknown to me. If it is undefined rather than
> >      rejected, optimistic registration would need a rethink (e.g.
> >      DMI whitelisting).
> >
> > Rong, happy to rebase this on top of your series or fold it in, if
> > you prefer to keep both wirings together.
>
> (+CC Vishnu)
>
> AFAIK, Vishnu is also working on adding the same support using the hw
> control trigger framework. Maybe they can answer your questions or
> integrate your patch into theirs.

Thanks, Rong.
Mark and I discussed this, and we are happy to go ahead with Qiling's
implementation rather than duplicate the work.

For some background, we had previously implemented the ThinkPad side
in thinkpad_acpi against Rong's hardware-control-trigger series and
tested it successfully on our hardware. We had been waiting for the
common LED infrastructure before taking that work further, so it is
good to see this moving forward now.

Regarding the open capability question, I checked the Lenovo
keyboard-backlight firmware definitions. MLCG provides an explicit
Auto-mode capability indication:

bit 20 =3D 0: Manual mode only
bit 20 =3D 1: Auto mode is available

So I think MLCG bit 20 is the appropriate indication to use when
deciding whether tpacpi-kbd-auto should be registered, rather than
probing level 3 or relying on ALS presence.

One clarification regarding "AUTO" mode: Auto mode on newer ThinkPads
is not necessarily ALS-dependent. Some systems use the ambient light
sensor as part of the automatic keyboard-backlight behavior, while
there is also an activity-only based Auto behavior where the backlight
turns on following keyboard activity and turns off after a period of
inactivity. Therefore, absence of ALS does not by itself mean that
Auto mode is unsupported. The firmware-reported Auto capability should
be the better discriminator.

Regarding MLCS bit 31 discussed earlier, please ignore that bit for
Auto-mode capability detection. The explicit capability indication is
MLCG bit 20.

Based on this, my suggestion would be to gate Auto-trigger
registration on MLCG bit 20 and leave the actual Auto behavior to the
firmware.

I am happy to test the next revision on additional ThinkPad hardware as wel=
l.

>
> Thanks,
> Rong
>
> >
> > Comments welcome.
> >
> > Regards,
> > Qiling Zhu
> >
> > This patch was developed with LLM assistance; I reviewed every design
> > decision against the framework sources and validated the behavior on
> > real hardware myself.
> >
> > [1] https://lore.kernel.org/r/20260618-leds-trigger-hw-changed-v2-0-c28=
c44053cf3@rong.moe/
> > [2] https://lore.kernel.org/r/20260203232219.11683-1-vishnuocv@gmail.co=
m/
> >
> > Qiling Zhu (1):
> >   platform/x86: thinkpad_acpi: Add support for auto keyboard backlight
> >
> >  drivers/platform/x86/lenovo/Kconfig         |   1 +
> >  drivers/platform/x86/lenovo/thinkpad_acpi.c | 104 ++++++++++++++++----
> >  2 files changed, 88 insertions(+), 17 deletions(-)



--

Regards,

      Vishnu Sankar
