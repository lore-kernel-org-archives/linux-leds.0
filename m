Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97BE5158B8
	for <linux-leds@vger.kernel.org>; Wed, 23 Sep 2026 12:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165929; cv=none; b=XzZcHwNOu54Spiq2dHTnfc4O6v7tvwVm7ZTKtwj3Xhz9WETX/5i/MjpiE7oeG6p7OXGwrcM76RyKxH/o1MR1kgH5COu8djvmo581tz5VX4Ds+S4ASxQnENOSmnGjm0nbiqQqFFkBpsxXPfWvUeylCem5UsaIfjENdFlVsmddxkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165929; c=relaxed/simple;
	bh=nycHpeqG+1oIMvtY0hvmEQQEnmXB7wjz8VXdVUhTNtA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ulns2/DliIznm8TBmSscW2s7LrAzG+5mOCBvmSkFrixaMk4JK7eH87md2+ZvodZjhnTkNaByzNvRXDRLgaNquo02OiIvoBRQJnm12SeTP/cpxKlfwYEuHBp/APdUE+KK3aqJkoE1aaYGL4J/icJOZUQNdd7VSzMJTDBgul0nIzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZvrHGR3; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZvrHGR3"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so596805a91.1
        for <linux-leds@vger.kernel.org>; Wed, 23 Sep 2026 05:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790165927; x=1790770727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=prVpAsjmMpwAYd/WbDTNxRVVPniTFSqmZS7Z70kOMCc=;
        b=nZvrHGR3QQlh03unUFvmxJSo2Yt5XrbEdvE1VtTwEjl48K/SFSaqdqKdIrXlO1Gu+Q
         xHd7742b2pnnYX6mdz/NFDduynKokkLgp3Sy6Ll8sn/ZiO9Cwt9+G1ki5RgahclGA3ev
         VcQkO9oLsVSXKyZ4Phb04NEwRMGhQFfKOPot49YCVM14daAtCj92hfoE4i48/ZPs8hms
         EjQGyGs88M8eSZWVo2flE0Oc+UA4VqRpoHc8h+Up74MPNCADXutnlI7NSTEZEvpcHbpx
         UzM8EwKbEVZ8pdWDwFxNxPqUkgF24wgRm1QH9LtvEzzj85j/c4HDROK50I60xHxrdsBE
         pynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165927; x=1790770727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=prVpAsjmMpwAYd/WbDTNxRVVPniTFSqmZS7Z70kOMCc=;
        b=lD42Y1gFur8Pxu2C0PGXuO+NMnKfGWvhOyBkiTEwJq4D5/EnpTQg/cEBWimHOeEG0w
         ZWtu+uoRAEJItRdYbCJHL03oBx/dLFcFepqeQ5gkGZ2zDvNu5vkla98HaKdsFzs8fSJd
         hAR8yFZOT+/NAJbdIrPpibaGZR6n9B+bC64GSISXm6CLr1b1L5kqvdqvgdHgKj0xNsDc
         Dj5PPalDKSWO+lTtbAdv6iMvwJ6wvaWTd3pDlOC8qecrlV7t+0C7GD2E0ulazOgnAbsn
         b5T3xi5tXy1jjUIKpaFV/fMRisxDaWoImJUZ1sCWEZE8ySShTGjWE/vl+qoPlkBHyIph
         EDEQ==
X-Gm-Message-State: AFuF++lx5vhsi/ZePPWcaUe23PY8EyGtYoj9xBou4KzZ1unfs7aBWwkN
	6BNAbkRL4LU6aWl9kmGk7DfK7/GyfiyLxdNSqTsND+wErIZT2x/9C2CIu4IWVw==
X-Gm-Gg: AYBFou0pnf84aHsFLWAa7Vj7S7cmNDhvs00Finpv89JOpVUA5gmsQj9wihzfiUk/n1a
	nZtkZeZiyc4qHrLHM9F21FPQcGrqfp8k0htknI/gjQZwQ3P+wr7U2Uxhd/ILJ6YGg2NOtGA/NHf
	FRkk6GTiWzHi1jnbuBSzSOet5/t8W57+F+oCB4624vlQ6kWiNtSAj63TgtQBDvZUYicNlzhww7b
	QZLnpQnbAdODwYOIr39/nJ9gvW3v5mwjiYW9UpRfBZhkt9EhQDf1P9w1mVyDIgun4tlty2zzmSH
	Np4i+l2FS6sU4o2Cgq9zwjggamAI4yjkkk4UsPl8vIsEcSFGsL+mojpVuik/tnD2tD4H8duKp4Z
	Qq84W0LwO0q6jCuxhwVsNmBk/1RwgAqjVfp6aUZ/5J4m/Up7d0NwgKk01tGbJdddZJz2JlLe8OF
	8ysNMFl3rtI5JRg9d7AKsTBKZHGxhPsbWuD7FMV4t1MrNaVsJ+1k5sHcVfRv1WEWIPYXbQz51b9
	MEzxg==
X-Received: by 2002:a17:90b:2b45:b0:39d:f189:48d6 with SMTP id 98e67ed59e1d1-3a07e5690efmr2138760a91.4.1790165922326;
        Wed, 23 Sep 2026 05:18:42 -0700 (PDT)
Received: from ROGZephyrusG16Air ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dbc013fsm5867255a91.5.2026.09.23.05.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:18:40 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	"Martin K . Petersen" <mkp@kernel.org>,
	linux-scsi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Benato <denis.benato@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Subject: [RFC v8 0/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver for ROG NVMe enclosures
Date: Wed, 23 Sep 2026 20:18:31 +0800
Message-ID: <20260923121832.2613187-1-nbg2974@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

v8, as its own thread. It addresses every comment from Lee's v6
review and Ilpo's line review; the notes below say what was done per
comment and where I think a comment rests on a misunderstanding, I
say so instead of silently keeping the code.

The submission format is git send-email from v7 on, the driver lives
in drivers/leds/rgb/, and it still has no Kconfig wiring: it is the
verified out-of-tree module, the wiring lands with the agreed SCSI
split. On the SCSI device handler itself: it is an out-of-tree
expedient, not a design statement. The enclosure exposes a single
mass-storage interface that usb-storage owns, so a USB interface
driver cannot claim it without taking the disk down, and hooking the
SCSI bus from a module needs the unexported scsi_bus_type. The
device handler is the one hook that observes the sdev without
claiming it. For in-tree, the attachment should move under
drivers/scsi in whichever form the SCSI side prefers, notifier or an
exported attach helper, and I will rework it accordingly.

Changes against the review comments:

- Includes sorted alphabetically, linux/err.h added (Ilpo).

- The vendor CDB is now struct ene_cdb, __packed, with named fields
  and a __be16 register set with cpu_to_be16() (Lee, Ilpo), plus a
  static_assert on the 16-byte size.

- The ENE register defines carry plain comments; the R,B,G wire
  order has named indices (ENE_WIRE_R/B/G) so the reordering against
  the R,G,B subleds no longer relies on magic numbers (Lee, Ilpo).

- struct asus_aura_zone became struct asus_aura, the per-enclosure
  context; the dirty bitmask is gone, each LED carries its own
  pending flag (Lee: LED-level attribute, faux indexing removed).

- The work item returns before touching the device when nothing is
  pending: an unlocked scan first, since a colour arriving after the
  scan re-queues the work (Lee). The locked snapshot follows.

- The write payload is copied into a DMA-safe per-device buffer
  before blk_rq_map_kern(); no stack memory is ever mapped for DMA
  (Lee, VMAP_STACK).

- ene_write() became ene_write_reg() with a tx buffer argument, the
  arg_count branch is gone (never false), and it returns 0/-EIO
  instead of the raw SAM status; the rationale for not using
  scsi_execute_cmd() moved to the commit message (Lee).

- The 10 s timeout dropped to 5 s, the development-history comments
  are gone, declarations are unwrapped, loop variables are declared
  in the loop, lines are reflowed to 100 columns, the code is grouped
  with blank lines, and
  asus_aura_register_led() frees its own name on failure (Lee).

- dev_err_ratelimited() instead of dev_err() on the work error path
  (Ilpo); _once() would hide a persistently failing device, and
  there is no caller to report to, the work runs detached from the
  LED core (Lee).

- strscpy() uses the 2-arg form (Ilpo).

Two comments I did not act on:

- .module = THIS_MODULE in the device handler: the in-tree handlers
  (scsi_dh_alua, scsi_dh_emc) set it explicitly as well, so I kept
  it, but I am happy to drop it if the subsystem prefers.

- kzalloc_obj() stays: checkpatch on 7.2 prefers it over kzalloc()
  with sizeof, and the sashiko report against it is based on an
  older tree (it has been in include/linux/slab.h since v7.0).

v8 was verified on hardware again: the four LEDs, per-LED colours,
60 sequential updates, unplug under load (zero splats, zero leaked
nodes, clean rmmod).

Comments on the interface shape and on folding this into the shared
Aura work with Denis remain very welcome.

Liang Haowen (1):
  leds: asus-aura-scsi: Add ASUS Aura RGB LED driver for ROG NVMe
    enclosures

-- 
2.55.0

