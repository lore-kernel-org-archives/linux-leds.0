Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596495;
	b=kbWdeWgrisMFJgzICgpBfLkbNypYviU5LmBputEC0fDnIAe6jsDCqbgBeKWns00fXNWL
	 47vXZjrkDxvC5F72D9lJReHqPKksQabB4Cv5nxecaGrKi83m1fNdkZFE1w/vNkV3dbZ1x
	 DAYWgPjVOe03BHO9Ig85Mhlc1sgxYoCEkZpfT0b9dISMjXQPRBJTzl1t8pD0+aMixRPmW
	 ozGBE1uDEio/duZ52j0secFajzmZNtZhv2GDErooj+Xl5QMWBe6yDBedaypTQACmtljIT
	 ra0jOhtiSRa2pVJItnVbFOjAPkp+j0uDNaNNMAXxj/xzSA4ahzTksOgaYFT7aHx6SQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wv9c8S5oFF0tJwBxIAPQ2CpHZNWF2YXmchzsVyS3ZOg=;
	b=WG1ltBTlg8rta0x5OnZWoZCkQSBGA3y5pHC7eaZNPbMl4xiKsfOoYPfOGU8o1J9P6EAH
	 o1iMfN+5fWYHwTRuOzULFk3iCLMIyW2DXEe1ZjIHAYqB1BahFi9YUBiIQhqzoUjgEkMOR
	 s1bMzHy4P8GdoWdbF8LmO6Ar5bLq8blHRUkgNl4zdSzJ3aa/1YIius58rrHXpn8POXYZN
	 BuKGnhKakFVelH1lKhueVvw+/lisOqIAvbH0TKFT6U47ujWgtg6IvUh8Tkut5tCnbdmqG
	 fiU+e3ml7OI3DZ1+B/DwdwdLetcWNYSUprHPyx4lDFVxH47OQjW+7gyffV9UJ6LYQxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TENQTGKO;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233F2606A32E
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 08:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 233F2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TENQTGKO
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-377157fde7bso1869982eec.0
        for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 00:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596494; x=1796201294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wv9c8S5oFF0tJwBxIAPQ2CpHZNWF2YXmchzsVyS3ZOg=;
        b=TENQTGKOk6g7kZ9FlbbGSf1mfOxsE4KdhEi4uBuv6FblPFCagzMtMYAhrIOtlqTdGp
         oZRX8JuntDuRfyqeWy4QE0EK0fdyN/bmkpqSlfpWWNx5ax9ZlYIdae+8Agz9kmb+bEsE
         ngSXEqXjxmIsyrMh3ciZyq7EKMUN1VQQqaU04fHJ7T09wYcWfVcR3yrJCeeyutVBEDWa
         g5F23NSaKzIsNSVPXpSr66u1PyekeKjQDgPrlO/exthUpqZDrmLMEhOb0c2neMZ4trOf
         h0kmobjg0rvjzTxSI9EV65MbB9L+Jj6QH5Yc21isYEFuqvh+7zFfpHTF1BY0eFjCdtOl
         9T0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596494; x=1796201294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wv9c8S5oFF0tJwBxIAPQ2CpHZNWF2YXmchzsVyS3ZOg=;
        b=OhhbIRwWvVVhX4F5ww0Kb/OXlSLPOyAeCvXSkeKKwHjgSzfQ89gHaNxOOLoK0PB1kB
         S1TqgEhSt396jp2J1f/DS4rwBi2IpZa5z7uuFF+x+OC7gwv3RdOiI6lspIMlJKnPylNE
         rRA4PtA5rjLdfbX0YqRP4FtCFcU1a800GTtrF4bBilkWJsoSr7NOTFf5ph/FWMpslxYQ
         GKh0YvgWpJaNp/di73kOpVbHEtHepR+rpL3ogkXuffW9CsICUJlygFAzrrQLNdvLaoxK
         tBdicJt1Soc/5d7VlbypFWz6d/i5gmv0MKbvmw0k27poB909HDUNkkh6poJ3NYh7+JfR
         I0HQ==
X-Forwarded-Encrypted: i=1; AL+hErFjxKaGljv6qn710dMmHuZANFTFn+4usPbsfkqWWzKYj050cJzRCmqLfqoXlt8bLdeisgQkaaZ5LpfI@vger.kernel.org
X-Gm-Message-State: APuU4Z8/Th2SZo7wLpa+lwQOY/ti53q4K2D1k9tZ2U5pSOomrBYek8je
	zQCZyfox5h3LQpZaMx/4J/glc4sqECl8Ushsggv+w1urglHdMxV96JSY
X-Gm-Gg: AZFdTZdHXfjionEDQZcoqtCRgVCSV86G4PnYad0VWvjUl/kCc09YO4c2Sy88D7iT3le
	xvN0S7zJW+gyjuNWMVD9dzukDQDPtuCNsvR87rGKCzRhJNGOw0nJrNsLhbg16mNVtxkjfhPZC6Z
	iH32BqDlzaK+vZbtHkjCC0XdHwKqa0tArEd8H1UGcV2xONUpNy/uRAlIuseanVZ3276skQyn6H1
	ik+tRHCuf4Jyts87i4twqGIcQndJTyXxdv0St2+y9RAPYG1onT492VevkHFUxFbEfL3Z4305Mdc
	akchtW8/kWMKKWFSX8KeH+Gmg1KYDXI1bK2YdaH3vxb3gHqPrtKcpy0LeFsbp7U6k1BF+nyRjXR
	zWasDZnRiYfLsWq0eXX2efO/JjYK2HbJMnCVJr8AjYKEAoFd943fsZiTYXwy7sbrEsZgEApwgwi
	AgRhlrx1iNEceVvzocRXhLBgI7XMjTP+NQ8c5PJDkOjd/zvKKWRIy7s8nlbrc/XY2kd1WWRgbgT
	7EF3hML1LlNmcmTGi+AZCoQQtGFGQXr/1Z9RVe6rE9XzD6ruVFVeBDEA2lELHOfE2pgHPnkHTAT
	KeyPD0DkeAlZnwfik9QD5e5+4+ca
X-Received: by 2002:a05:7300:b089:b0:386:9c9f:83d8 with SMTP id 5a478bee46e88-3869c9f86bbmr14134981eec.17.1795596494078;
        Wed, 25 Nov 2026 00:48:14 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm18879252eec.9.2026.11.25.00.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:48:13 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-leds@vger.kernel.org,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>
Subject: [PATCH v4 0/6] platform/x86: thinkpad_acpi: Add a keyboard backlight auto-mode trigger
Date: Wed, 25 Nov 2026 16:46:37 +0800
Message-ID: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

On supported ThinkPads, Fn+Space can select automatic keyboard
backlight control.  This series exposes that mode through the private
LED trigger "tpacpi-kbd-auto".  The first patch fixes an out-of-range
brightness value that was reported to make UPower stop tracking hotkey
changes on a ThinkPad X9-14 Gen 1.

This is v4 of the thinkpad_acpi keyboard backlight auto mode series.
Many thanks to Rong, Mark and Vishnu for the reviews and the firmware
side answers so far, and to Andrea for the report behind the first
patch.  I have tried to follow the v3 comments one by one; where I was
not sure how to read a comment, I say so below and would be glad to be
corrected.

As Rong asked, this version starts a new thread.  For reference, v3
is here:

  https://lore.kernel.org/r/20261114174814.62153-1-kmatzkaczor244@gmail.com/

and my reply with the sleep test data is here:

  https://lore.kernel.org/r/av14Sp6_nKwU5F-i@ThinkPad/

The series went from seven patches to six: the two suspend/resume
patches of v3 are replaced by one, which now sits before the trigger
patch.

  1/6  Report auto keyboard backlight mode as off          (stable)
  2/6  Extract kbdlight notify helpers                  (refactor)
  3/6  Don't poke keyboard backlight's LED core brightness (writes)
  4/6  Restore keyboard backlight level ourselves       (sleep/wake)
  5/6  Detect auto-mode capability via MLCG             (groundwork)
  6/6  Add a keyboard backlight auto-mode trigger         (feature)

Changes since v3, by comment:

- 1/6 does the mapping in a small helper with an int return type, as
  Rong suggested while reviewing the trigger patch; 4/6 reuses the
  helper for brightness notifications.  With 1/6 on its own, on kernels
  that still use the LED core suspend/resume path, a backlight that
  went to sleep in auto mode comes back off after resume, where the
  unmapped value used to be written back; 4/6 restores the level the EC
  had.  I kept 1/6 small so that it can go to stable on its own, and
  would like to hear if this trade-off looks wrong for stable.

- 2/6 takes the title Rong suggested, states the locking contract with
  lockdep_assert_held() instead of a comment, and drops the braces.
  The helpers are placed where the later patches need them, in the
  hope that no later patch has to add a forward declaration.

- 3/6 takes Rong's title.  Of the two software write paths, only the
  proc path reports changes through brightness_hw_changed; the sysfs
  path just writes the level and updates the cached one.  Fn+Space
  changes continue to be reported.  The text after the --- line is my
  attempt to explain why leaving the LED core's cached brightness alone
  seems acceptable to me; if the reasoning there falls short, please
  tell me.

- 4/6 replaces v3 5/7 and 7/7.  With the driver unloaded on my
  machine, the backlight went out when entering s2idle and
  hibernation; on wake from s2idle the EC was back at its previous
  level, and on wake from hibernation it was at 0 for each of the four
  starting levels.  So kbdlight_suspend() is gone and kbdlight_resume()
  writes the cached EC level back on resume, for every model rather
  than only auto mode ones.  The cached level becomes the raw EC level
  in this patch, so that resume treats the auto mode like any other
  level.  I did not add a check on LED_SUSPENDED: this LED does not set
  LED_CORE_SUSPENDRESUME, and with the suspend callback gone I do not
  see what would set the flag for it; my understanding of Rong's reply
  was that such a gate might not be needed.  The patch comes before the
  trigger patch so that no intermediate commit has the trigger together
  with the old LED core suspend/resume path.

- 5/6 uses a symbolic name for bit 20, as Rong asked.

- 6/6 routes trigger activation through the helper that also updates
  the cached level, which I believe addresses the stale cache Sashiko
  reported.  It also skips the trigger notification when the trigger
  could not be registered, pulls the registration into a small helper,
  and still makes the trigger the default one at init when the EC is
  already in auto mode, now with a comment on the case this is meant
  for, as Rong suggested on Nov 19.  The title was changed to say more
  precisely what the patch adds.

On the Reviewed-by tags: the changes to 1/6 and 5/6 are small, but the
diffs are no longer the ones Mark reviewed, so I dropped his tags there
and noted it under the --- line.  Mark, when you have the time, could
you take another look at these two?

I could only test on a ThinkPad X1 Carbon Gen 14 (linux-next
next-20261030): the software paths (selecting and dropping the trigger,
brightness returning -ENODATA in auto mode), the trigger following
Fn+Space in and out of auto mode, and suspend/resume from manual
levels and from auto mode, with s2idle and with S4.  No S3-capable
machine and no other model was available to me, so testing elsewhere
would be very welcome.  Vishnu, Mark, thank you for offering.

One observation from testing with a desktop session, since it can look
like a driver bug at first: the level restored on wake was sometimes
overwritten again a few seconds later.  KDE's power management writes
back the keyboard brightness it last knew about after resume, and a
level written directly through sysfs does not appear to reach it;
changes made with Fn+Space or through the desktop itself did not seem
affected.  I do not think there is anything for this series to do
about it, but I wanted to mention it.

One naming note: kbdlight_brightness now holds the raw EC level,
including the auto mode, rather than a brightness; a comment above the
variable says so, and the name is unchanged.

The only checkpatch.pl --strict warnings I see are for three commit
IDs that are missing from my shallow clone.

This series was developed with LLM assistance; I reviewed every design
decision against the framework sources and validated the behavior on
real hardware myself.

Regards,
Qiling Zhu
