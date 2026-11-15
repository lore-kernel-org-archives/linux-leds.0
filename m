Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794729498;
	b=WeGzt63SXz0P+ZumCWP1pFXp8ym681TNOso8AlQO5KynbQfmIgREnJ/wguutqdMOV3YZ
	 EwW1Kult8O+vlpipM9AgGswdrwhLI4tQw9PDdA9gPsuOsxiRZJNJfLZOYIlTV0bC/lmwJ
	 7Ea1yGmyH7j8/zAM2cK8d3z9Fwi9xxUekeBOcrJ4ztnjvxfJwpEFmWBxln3tkLZfw4SfN
	 sxIuDIVDd/8Ef7O8CneuFFNNiI+2S68RCleQff4QZWC8M/Lwo+6Bn/8g+9F9Wl876BSjq
	 90T2IWKc7iRK2w41Etv+uvM8cKvUNFO2WzjNuceFtrpLxCIH5IxoqKnj0EZFGKF3zYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794729498;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=05IOe9HqJkWhqKvUBJVfU/SAL+xPCR/Byzx9O7+JrPI=;
	b=TblDrCG36J7mvVd0o/cCUBva543HOPMIjSqi8ojwt2fq8sK1F4AtwX1ZJCGlsZS2U4yV
	 de2VD6MvsHSf8dJ3fs0Dh+WS/DTY2GVizW7yufVRogtGbcC0gWi6PoSMEcoNpxNoRC1pK
	 P+dmpK8ImUMN07tKLdqoSl7XVjH8btskxAkvtg0HojSgFQG334vNCzy1dVhurQaEH8VS2
	 0Y702+aQCtk7wLr10o4h60dHWlATmhiJBr7BgfcGNS3KB9c0plCLArH6wcOQmYyVwzhpf
	 iet+nZJeJcY5IcQVS9xF2llp6YHHP4xsxIL5iGUKO+IJWkGOJIfoQA+W8PaxkE/ypaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=nU6PyZVn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB9B606A31D;
	Sun, 15 Nov 2026 07:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBB9B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=nU6PyZVn
ARC-Seal: i=1; a=rsa-sha256; t=1794729471; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XPA4K2S0K4QuFahjL33GNLMjMak11iOF+0O3K8CZzyVUxt63zy9FOfgQRgUJnlaMP2PsqjMkKnGgcnvw8lBU8MU4Jp79rfw6GHXAXELvkZd/Kxne3nKKQo72T/fK/X8xPu4Ec3vGaoBqboYP/JTD1vuqy0wtiNiOgO4+BuaJVF0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794729471; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=05IOe9HqJkWhqKvUBJVfU/SAL+xPCR/Byzx9O7+JrPI=; 
	b=b8vkkqmjt9GPNV3u/hMyltOfymeSXgcfyMjj50ofBBdOwHichO+29yWNFb8MCPjYFXF/rIEkII4/Zx78SUUqaPfSg/RnFx/iTwcOkqVE91J2OCEYhTqfuJPPLxWdqZMnUqRSpzxuC75HXVBaGsh/12Rw1OvCWTS+sRGEO8zpu4U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=nU6PyZVnjwX2D9OAqkeq7xjUUrh0RJSnsJuLLguBdBZwkMqI7put65BfMZ5iw3DaAu1/Kny0M/z/Mq+weG1QIFAIuV/N5LaYfshAvFOEwaq7cNnyp+X9XzUwbg3YKf3544bYjFbWNyMOJ63XX0CGT5JDBZoj9RVet7KdGfDjuwnH5HNT8jlnR77ypJKy0UV0q+AKAcN0fn/l4G/EUFTXsHsxcLT+rjY8d9S9oclBpZBhm4fSbUBTrl2d9qNSKcgC1uQ1YKvIsTzUDGaE0pu31HIQTTVkRv5G2xGZ9Jg9nEo0U5ErRgRKS8RxdC6qYLg91Hz7y1w70+JHlP78vRlTqg==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=05IOe9HqJkWhqKvUBJVfU/SAL+xPCR/Byzx9O7+JrPI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794729468897515.208258334714;
	Sat, 14 Nov 2026 23:57:48 -0800 (PST)
Message-ID: <230263171c25c322d97fa29439a01922db47f913.camel@rong.moe>
Subject: Re: [PATCH v3 0/7] platform/x86: thinkpad_acpi: Add support for
 auto keyboard backlight
From: Rong Zhang <i@rong.moe>
To: Qiling Zhu <kmatzkaczor244@gmail.com>, Mark Pearson	
 <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Henrique de Moraes Holschuh	
 <hmh@hmh.eng.br>
Cc: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>, Lee Jones
	 <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman
	 <griffin@kroah.com>, vishnuocv@gmail.com, vsankar@lenovo.com, 
	platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261114174814.62153-1-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
	 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 15:52:36 +0800
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

Thanks for working on this.

On Sun, 2026-11-15 at 01:48 +0800, Qiling Zhu wrote:
> Hi all,
>=20
> Thanks, Rong, for the two rounds of detailed review, Vishnu and Mark
> for the firmware-side answers, and Andrea for the bug report that
> became the first patch. This v3 addresses the feedback in full; the
> series grew from two to seven patches to pick up the suggested
> structure and to make the fixes independently backportable.

The next time when you send a series (i.e., PATCH x/n, n > 1), please do
not reply to the previous thread to keep it tidy.

>=20
> The series in short:
>=20
>   1/7  Report auto mode as brightness 0 instead of 3          (stable fix=
)
>   2/7  Extract kbdlight_notify_change() helpers               (refactor)
>   3/7  Sync LED core state on level writes          (write-path sync)
>   4/7  Detect auto-mode capability via MLCG bit 20            (groundwork=
)
>   5/7  Skip LED suspend/resume on auto-mode machines
>   6/7  Add support for auto keyboard backlight                 (the featu=
re)
>   7/7  Reconcile EC level on resume
>=20
> Changes since v2, by comment:
>=20
> * The notification path is now split as suggested: a helper that accepts
>   a level and a wrapper that queries the EC (2/7), and the proc write
>   path goes through it (3/7), like commit 07f48f668fac did for the
>   ideapad FnLock LED. The manual check-then-act trigger removal is gone
>   entirely; leaving auto mode through either interface now drops the
>   trigger through the LED core.
>=20
> * LED suspend/resume is skipped entirely on machines that support auto
>   mode, keyed on the capability bit rather than the current level (5/7),
>   as suggested. My testing confirms the firmware restores the previous
>   level on its own in all cases except auto mode across hibernation;
>   less state remains in the driver, and the class of races around
>   LED_SUSPENDED disappears.
>=20
> * activate() is now a one-liner with no read-back verification (6/7);
>   it only writes the level, using the plain set helper. I did not use
>   the updating wrapper there on purpose: the trigger core is in the
>   middle of its own activation flow at that point, and the 0x1012 event
>   that follows the level change is expected to bring the state back in
>   sync through the regular notify path.
>=20
> * Trigger registration is gated on MLCG bit 20 as per Vishnu's
>   confirmation (4/7 + 6/7).
>=20
> * Andrea's report is fixed by 1/7, which reports auto mode as 0 to the
>   LED classdev and is marked for stable. It is deliberately minimal -
>   a single check, no further splitting - to keep backporting easy.
>=20
> * On the proc attribute deprecation: I support the idea, deferring to
>   the thinkpad_acpi maintainers.
>=20
> One addition that was not in v2: testing showed that the firmware does
> not restore auto mode across hibernation
>=20

How about s2idle? And what if hw brightness =3D [0,2] before hibernation?

Meanwhile, could you test s2idle, hibernation and cold boots with
thinkpad_acpi blacklisted to see if hw brightness ([0,2] and 3) is
preserved? We need the raw behavior to determine our strategy.

>  - the EC comes back with the
> backlight off, without an event. Rather than re-attaching the trigger
> from the pre-suspend state,=C2=A0
>=20

"re-attaching"

I am not familiar with hibernation, so I am not sure if the LED core
would detach the trigger before entering hibernation. If not, why did you
say that?

Thanks,
Rong

> 7/7 simply re-reads the EC level on resume
> and routes it through the regular notification path. If the firmware
> exits auto mode across hibernation, the driver simply reflects the
> resulting EC state rather than restoring the previous mode: it stays
> out of the firmware's way and only synchronizes, which keeps the code
> simple. Happy to hear opinions.
>=20
> A few notes on the result:
>=20
> * Writing a level through either interface now also emits
>   brightness_hw_changed: both write paths share the same notify helper,
>   which keeps the LED core and userspace listeners consistent with the
>   new level no matter which interface was used. Rewriting the current
>   level emits nothing, matching the firmware's own
>   no-event-on-same-level semantics. Extending the notification to
>   userspace-initiated changes seemed reasonable to me - the OSD then
>   also reflects echo-based changes - but I'm happy to restrict it to
>   hardware-initiated transitions if that is considered the better
>   semantics.
>=20
> * All state transitions now run under kbdlight_mutex in single
>   critical sections (query + reconcile, write + reconcile), with the
>   set and notify helpers expecting the caller to hold it. On the
>   ordering with the LED core's trigger_lock, my reasoning is that the
>   trigger callbacks (activate, hw_offloaded) are reached with
>   trigger_lock held and then take kbdlight_mutex, while the
>   notification helper is lock-free (it only queues the worker), so I
>   don't see a reverse nesting. Extra eyes on this are welcome.
>=20
> * The cached level is now the raw EC level including auto mode, so the
>   kbdlight_brightness name has drifted a bit from what it holds.
>   Renaming it would touch quite a few places; I left it as is for now
>   and can do the rename as a follow-up if preferred.
>=20
> One open question, mainly for Mark and Vishnu: the skip of LED
> suspend/resume assumes the firmware turns the backlight off on suspend
> and restores it on resume on all auto-mode capable machines, which is
> what I observed here for manual levels (suspend and hibernation), auto
> across suspend, and auto across hibernation coming back off. My belief
> is that most machines handle this fine, but more testing on other
> models or a look at the EC documentation from the Lenovo side would be
> needed to be sure; if an exception turns up, a DMI quirk could restore
> the old path for that machine.
>=20
> Tested on my ThinkPad X1 Carbon Gen 14 (linux-next next-20261030).
>=20
> I'm still learning the ways of upstream; thank you all for your time
> and reviews, and any further comments are most welcome.
>=20
> This series was developed with LLM assistance; I reviewed every design
> decision against the framework sources and validated the behavior on
> real hardware myself.
>=20
> Regards,
> Qiling Zhu
>=20
> Qiling Zhu (7):
>   platform/x86: thinkpad_acpi: Report auto keyboard backlight mode as off
>   platform/x86: thinkpad_acpi: Extract kbdlight_notify_change() helpers
>   platform/x86: thinkpad_acpi: Sync LED core state on level writes
>   platform/x86: thinkpad_acpi: Detect auto-mode capability via MLCG
>   platform/x86: thinkpad_acpi: Skip LED suspend/resume on auto-mode machi=
nes
>   platform/x86: thinkpad_acpi: Add support for auto keyboard backlight
>   platform/x86: thinkpad_acpi: Reconcile EC level on resume
