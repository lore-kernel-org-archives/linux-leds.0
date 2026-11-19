Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795098440;
	b=I5AoyXIAEsvExugt63DLFD17zIEP+OXcpsRRx+nvQTdYfV2kRgBlfiSi/269rOwA0hhl
	 OcBQ8Zwwfyi23lRyYkH/X7gpIYEoOog0XBW+iochVJgJqFBmc8rZOBQvmSMHanfCr59wg
	 qUbxGGJBuji4Z428rNQXtxBscKO6En+YDSoCVzqnQct4Pvk4Yy1C6fjyBlZ2/kSz72vqd
	 tfS7UHUZJzn+Lr+4aAxMEmp7c188wbeGoBBGRbw9axmQ9JdYBXaYZPbB7RFT41NwbVcmx
	 qaamTAk92bIky3U3LWajnhGvD6SrjxceCmwstO9TrdroQEaOGd3689+3TYczx/Cyymg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098440;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=yeZaOOJQmxIdsD84RVLJrAVDq+lcoQB9tL9dTj0IG0U=;
	b=GQBsbEdR65QWU9U29TtXXoF3i1q7S6XSUSGgqMahKQLKFRp8k9n+VPeiZOKcwZwkoy93
	 9cNryXVb1ko5OqAa9omr6YioiyA0dlbZcFdhyyor9E/y0E/MRXHlj1Ww8O04ZyoiaPeOr
	 PBYCwvCKwKXy+A4nB5pNgKDsvgsolY2ZKlVS4VWwQTb5CfD8Ig/0mc6oGoMzFpdy7grNZ
	 NCse2Mf51au5Cr6ffVG3dH9aQ72PbsRaSqOHpfHnQxAkINaUBxICwTV4blIUySJGhJ4M9
	 jjkpSSaA7D0npMxEKFlFNT03WlIpciwmCuPKn8w3nBQOEhzpaP31BkNd51hcoOAhZTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=digZSmql;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBA4606A320;
	Thu, 19 Nov 2026 14:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DBA4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=digZSmql
ARC-Seal: i=1; a=rsa-sha256; t=1795098413; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Daq+THbxZb077fjeH+m9cljFpBxsmOQxeJmFZv/Il/aJcd6krl6BBDkwKTb7cw77SNSuy5VOGr6q1Olnoma40hPeFS13HBWunC3fxoCtZ5pcCV5xtFKArXV2DKd9S/e3yqdHp9cF/pyQ3dyrq01eSN1GNeuIb9mtm53EmMVenXg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795098413; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yeZaOOJQmxIdsD84RVLJrAVDq+lcoQB9tL9dTj0IG0U=; 
	b=E7VqDoqUkc4Zy2ZilY8NPvnTpBrQIlH8DSRwwNz8Nv3kzf1zxoKo7iUJEx+95S0vJ2cl63YTUrYnvkx4x/palfLVNbChDgCr93BOogQVwflBS2sroEws0UeuZDslzs7iYF8qdVRgOTFt394FfsY2pz+NKZwBlToUxBqj7o9y0jY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=digZSmqlcdfB19lz34NtCtjnRYz7rHa/+yXX/eqC/0D/rhQSED1yP4Zc9Em+BRI5YAzVJibOdHzihOWSX/rjfxqKSponX+Jk+Q+Gl69LNQbScp+7GJMBdKgDgLmZK5R3UReOpCfwJPX6lng2CsWBlvuhXTxcyxaAvKmtFXvHOJ4i3qYDpu1LX2Hg+BHhdoLT0DZ1HKmP5c3RkbR9rKbdeZDEHD5gl3sZKDCsc5zz6Zlbv2spqdt4b0dw1OoNPfkQ4573QOByhx3nf49KuSwlq52nveaj0+qI+SotCIQz4npI+FpsdaSzoBZAhDjdh4Pi0w3OAwW4Sd5NXgx7+124eQ==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=yeZaOOJQmxIdsD84RVLJrAVDq+lcoQB9tL9dTj0IG0U=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795098411700405.2739567587512;
	Thu, 19 Nov 2026 06:26:51 -0800 (PST)
Message-ID: <be1dc7e529d82725e6fc528975a9ba0126436a73.camel@rong.moe>
Subject: Re: [PATCH v3 0/7] platform/x86: thinkpad_acpi: Add support for
 auto keyboard backlight
From: Rong Zhang <i@rong.moe>
To: Qiling Zhu <kmatzkaczor244@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark"	
 <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Henrique de
 Moraes Holschuh <hmh@hmh.eng.br>, Andrea Rabbaglietti	
 <rabbagliettiandrea@gmail.com>, Lee Jones <lee@kernel.org>, Pavel Machek	
 <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, 
	vishnuocv@gmail.com, vsankar@lenovo.com,
 platform-driver-x86@vger.kernel.org, 	ibm-acpi-devel@lists.sourceforge.net,
 linux-leds@vger.kernel.org, 	linux-kernel@vger.kernel.org
In-Reply-To: <av14Sp6_nKwU5F-i@ThinkPad>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
	 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
	 <230263171c25c322d97fa29439a01922db47f913.camel@rong.moe>
	 <av14Sp6_nKwU5F-i@ThinkPad>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 22:21:42 +0800
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-3 
X-ZohoMailClient: External

Hi Qiling,

On Wed, 2026-11-18 at 19:02 +0800, Qiling Zhu wrote:
> Hi Rong, Mark,
>=20
> On Sun, Nov 15, 2026 at 03:52:36PM +0800, Rong Zhang wrote:
> > The next time when you send a series (i.e., PATCH x/n, n > 1), please d=
o
> > not reply to the previous thread to keep it tidy.
>=20
> First, my apologies for sending v3 as a reply to the v2 thread. I caught
> that mistake shortly after sending it out, and I will make sure v4 starts
> a clean thread. Please do let me know if I am getting anything else wrong
> with the workflow; I am still learning the process and really appreciate
> your guidance.
>=20
> Thank you both for the reviews, Rong for another patient and detailed
> round, and Mark for the Reviewed-by tags and the sleep/wake input. I will
> apply all the requested changes in v4 (including moving
> kbdlight_level_to_brightness() with an int return type into 1/7, adding
> the lockdep annotations and symbolic macro, fixing the helper placements
> and indentation, updating kbdlight_brightness in
> kbdlight_set_level_and_update() and using it in
> kbdlight_auto_trigger_activate(), and adding the note below '---' for
> Sashiko's report).
>=20
> > > One addition that was not in v2: testing showed that the firmware doe=
s
> > > not restore auto mode across hibernation
> >=20
> > How about s2idle? And what if hw brightness =3D [0,2] before hibernatio=
n?
> >=20
> > Meanwhile, could you test s2idle, hibernation and cold boots with
> > thinkpad_acpi blacklisted to see if hw brightness ([0,2] and 3) is
> > preserved? We need the raw behavior to determine our strategy.
>=20
> Here is the raw hardware behavior data you asked for.
>=20
> Test setup:
> - Machine: ThinkPad X1 Carbon Gen 14 (21V8A028CD), BIOS N4OET53W (1.16),
>   EC N4OHT42W.
> - Kernels: 7.3.4-arch1-2 and 7.3.0-next-20261030 (identical results).
> - Method: For the s2idle and hibernation cycles, thinkpad_acpi was
>   unloaded with rmmod before each cycle so the driver was absent
>   throughout sleep and wakeup (my kernels are built as UKIs with a
>   baked-in cmdline, so I used rmmod rather than a boot-time blacklist).
>   Backlight levels were cycled only via Fn+Space and read back by
>   evaluating MLCG directly via acpi_call. This machine only exposes
>   s2idle (no S3), so "suspend" below means s2idle/S0ix.
>=20
> Results without the driver loaded:
>=20
> - s2idle: The firmware turns the backlight off on suspend and restores th=
e
>   previous level on resume across all levels (0, 1, 2, and 3/auto).
>=20
> - Hibernation (S4): The firmware turns the backlight off on entry, and on
>   resume the EC comes back at level 0 for every pre-sleep level, manual
>   levels 1 and 2 included. My apologies for the wrong statement in the v3
>   cover letter where I said manual levels survived S4 on their own; my
>   earlier test was likely interfered with when the driver/userspace was
>   still active. Please take this clean test as the accurate result, which
>   also aligns with the concerns you both raised.
>=20
> - Cold boot and warm reboot: The EC always initializes to level 0. Since
>   kbdlight_init() only reads MLCG without writing MLCS, and the pre-resum=
e
>   hibernation logs show the same reset to 0, this is firmware behavior.
>=20
> So on this machine, the firmware handles s2idle by itself, and S4 resume
> is the case where the driver needs to restore the pre-sleep level.
>=20
> Regarding S3: as far as I could find in public sources, modern ThinkPads
> essentially only support s2idle and S4 (ThinkPads moved to S0ix-only
> around Gen 11 in 2023). I do not have an older S3-capable machine to
> test, so I can only speak for this platform.
>=20
> (One small side observation from logging raw MLCG values: bit 22 was 1
> whenever level 3/auto was active and 0 across manual levels 0-2 on this
> machine. Just sharing as a single-machine data point in case it is useful=
.)

Let me conclude in short:

- S0ix preserves everything
- S4/S5 resets everything

>=20
> > >  - the EC comes back with the
> > > backlight off, without an event. Rather than re-attaching the trigger
> > > from the pre-suspend state,
> >=20
> > "re-attaching"
> >=20
> > I am not familiar with hibernation, so I am not sure if the LED core
> > would detach the trigger before entering hibernation. If not, why did y=
ou
> > say that?
>=20
> Sorry for the poor wording in my cover letter. The LED core does not
> detach the trigger across hibernation; what I meant to say was "writing
> level 3 back to the EC", not re-attaching the trigger in the LED core.
>=20
> Following the comments from you and Mark on 7/7, I agree that restoring t=
he
> cached level in the driver on resume is the right approach: calling
> kbdlight_set_level(kbdlight_brightness) in kbdlight_resume() without
> emitting notifications. Since the LED core's own brightness cache only
> stores the translated brightness (where auto mode is 0), restoring from
> kbdlight_brightness in the driver handles both manual and auto modes
> cleanly. I prototype-tested this on my machine: after S4 resume the EC
> was restored to the pre-hibernation level for both manual levels and
> auto mode; when the pre-sleep level was auto, the auto trigger stayed
> attached across the whole cycle; and on s2idle resume, rewriting the
> unchanged level was a harmless no-op.

Yeah, we don't need to differentiate S0ix and S4, but simply restore hw
brightness regardless.

>=20
> Regarding your suggestion on 7/7 about dropping led_classdev_suspend() an=
d
> led_classdev_resume() across all models: since I only have this one
> machine to test, my tentative plan is to keep the new behavior gated on
> tp_features.kbdlight_auto (so non-auto machines stay on
> led_classdev_{suspend,resume}(), while auto-capable machines skip
> kbdlight_suspend() and restore kbdlight_brightness in kbdlight_resume()).
> If you and Mark prefer replacing led_classdev_{suspend,resume}() across
> all models and handling suspend/resume in the driver ourselves, I am happ=
y
> to widen it.

AFAICS, the reason why thinkpad_acpi's current implementation needs to
call led_update_brightness() and led_classdev_{suspend,resume}() is
exactly because it pokes led_cdev->brightness.

Since your series will remove the fragile behavior and track hw
brightness using kbdlight_brightness, we no longer need to rely on the
LED core to store and resume the last brightness for us. That's why I
prefer to unify the routine among all models.

You might still call led_classdev_{suspend,resume}() to set/clear
LED_SUSPENDED if you would like to gate brightness changes from the LED
core somehow to make our jobs undisturbed. But I am very unsure if we
really need to gate changes from the LED core like that...

>=20
> Lastly, I have two small questions on 3/7 and 6/7 to make sure I
> understand everything properly:
>=20
> 1. Calling kbdlight_notify_level() in kbdlight_write() vs. sysfs writes
>    (patch 3/7):
>    I will change kbdlight_write() to call kbdlight_notify_level() and hav=
e
>    kbdlight_set_level_and_update() only update kbdlight_brightness as
>    requested. Just for my own understanding of the design principle here
>    (and in commit 07f48f668fac): since leds-class.rst describes
>    brightness_hw_changed as being for hardware-initiated changes, is the
>    idea that a legacy out-of-band interface like /proc/acpi/ibm/kbdlight
>    changes the level behind the LED core's back (so the LED core and
>    UPower need to be notified to stay in sync), whereas sysfs writes
>    already go through the LED core and shouldn't echo a notification back
>    to userspace?

Exactly.

>=20
> 2. Keeping the default_trigger check in kbdlight_init() (patch 6/7):
>    Since the EC resets to 0 on cold and warm boots on my machine, I agree
>    that no LED_RETAIN_AT_SHUTDOWN / exit-retention logic is needed.
>    However, if a user presses Fn+Space into auto mode before the driver
>    loads (for example, at the BIOS or disk-encryption password prompt,=C2=
=A0or
>    while the module is unloaded between rmmod and modprobe,=C2=A0which I =
hit
>    during testing), setting default_trigger keeps the initial trigger
>    state synchronized with the EC. Would it be okay to keep that check in
>    kbdlight_init() for those cases, or would you prefer dropping it?

Makes sense. For this specific use case you can keep the default_trigger
probing routine, with a brief comment explaining the purpose.

Thanks,
Rong

>=20
> (One minor hardware note: occasionally my unit retries entering S4 a few
> times before succeeding, and resumes after those aborted attempts can sho=
w
> timing oddities. All data above comes from clean hibernate cycles, but I
> am happy to dig into the retry case if it is of interest.)
>=20
> Thanks again to both of you for your time and patience; I have learned a
> lot from your reviews.
>=20
> Best regards,
> Qiling
