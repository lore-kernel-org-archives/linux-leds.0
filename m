Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E195B483BC2
	for <linux-leds@vger.kernel.org>; Fri,  4 Sep 2026 12:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526682; cv=none; b=YHauwkbVIjlQkNVqXPpUvqNNsV354oPE2GezJ90RwWaRE2cb/+t9A077GJX9S0t1BtDNftJyX4qnLWstizbHsDfK9GW7in5Mo/LUnzOlYN8TRq+ghb/roSB40c6snpe1y113zohQdK2wr5E2TTsqzB8QkDcf8AmUuKlgqjBrBa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526682; c=relaxed/simple;
	bh=/u7yvYvbT44iz4P3NSPmATvikZpCTdXLDwh+z6TVtbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZyHAHWeiZe4YvP+IG1+xnClb4CHAtqRmB86vbbpYohannieB+3tcKOciWrmjB7WknxIA7eLVKiZPP6vd5NISz/3h7lMCU28EzCRrGKX5iJRVnPs4UWrFNhhyJwUi0gLYzCRg+Tn3+Z2Xh+wQQEgd3mJEFEnZ5W6Ee4aMgz2Q6dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p86rS7zq; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p86rS7zq"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso1070248a91.3
        for <linux-leds@vger.kernel.org>; Fri, 04 Sep 2026 05:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788526680; x=1789131480; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a8cAPX0qoNPrh55TaKC4p5HikxGn38nOetRwDMVXORs=;
        b=p86rS7zqLzrv9BiVCxVoSnJGYC/TJIshaInxtGY7lICrD40aOG4C5JVdCMrxWZ9vXN
         QE+jG7RvA4wqNjnDVIdJ4r5020JQNR+QZJ35K5WUWKaNHd4CZ4d5YzaSMfPT2Tsxww/x
         6pp+C+BgYRd/1qjNJh0UQQYzNrMFRtuO+s53AF1WUM5Rqs7kEfums9bJpbHvyp4Jd3DQ
         Xn7WGl99Qn8qkWsvoLsXgkHr+J8NEnqCIs99IsIBwgHADZcko+Z9tpk6JNU+gkBiGx5F
         4KWqQQLsUmFMaRDck2DI9fqInOqEiDCMNbEOoy9kpQuGMHLTGYLx2SioWHuaUALIu0Z1
         ZU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526680; x=1789131480;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a8cAPX0qoNPrh55TaKC4p5HikxGn38nOetRwDMVXORs=;
        b=N9wKzRnmyUt6opxUN8lUh/eCMLvvp7+GgsELqGPvJKoAH54QDEUGwg7A37qbyOPmGm
         MRjnzDTjx1LmwAf2ahqi/Z5mghoYAGAWq9hfoCVkaJBjcuoNgpbGixkxQb2dYgws8StG
         i9wFim/760qow+S3icfS6ykEOYnbyZfTcGoWhfJ9NzpPaF4dFkm4Svwui8SSSyB1O/CL
         aSou7V4M7Hn/ZrGitBIeRc30H8Qg1X6kk4FztqhrCMLsqAWkGWj6wwuxsT8wHR7j7ABA
         TQAZ79cmlsHCQm9PPdjTBdkqdVskbGd3btxk9fvGrJWUu+f1Fcs5HTPndNolkvPXI0FJ
         TeEA==
X-Gm-Message-State: AFuF++mi2Sd6TJLkSNDNBXKaAxRMJ1NLLPyV0VH54U382BVhYGQgQGZy
	EUafo3jW3O/3oYZJqI7QUWrIqbQmFjNcncL8IM8W3Vf8CCRuKls2TruP
X-Gm-Gg: AYBFou2u/T0QqEw2a6RacktHUDVEQww5gOHBaIKZQbF/NwnElahJ0hUcNMcnjrXBTWK
	8U2k1StWKexzw0OUaAklMgqgrOg/wUuCdD2CNJ8dVPU4eUf+5EXGrLTqLI8hR8erYMpOmqm5bRA
	zSvq4AhvdWVDxJalJNI2k9E/FHUlktNKR7DYmyxrzW+R33dMnxJKyPhxrQXLwzeA7zETgfoWkqf
	U5s9eHeePmg31tQHowu7RbWuf2m81kNHEwHrnlBljpDBlak0jYba/OQgfv4GnfLwPzwfMD3kLMg
	YFUxCMTR8uu6tngV/bO6BfQz9QMTSjMDirZEWBb3eUurAnAXxuZHoRbapO/FOZmPwCgpIkr0qQT
	PyUU7udmLSg8PqM2BWs/I5uw+NCsTSs1N97tpfg86CWnhid1lneYPFapyfBx6G8vyc3wKNGF2hw
	+aNsKheIgIkoptmuYTULS2KmeribBPuUOQ8J7SpOAXWXOPHUPavB15j8y37Z3djb8HvA==
X-Received: by 2002:a17:90b:5866:b0:398:e73e:5a13 with SMTP id 98e67ed59e1d1-39b2613272amr8567041a91.9.1788526680063;
        Fri, 04 Sep 2026 05:58:00 -0700 (PDT)
Received: from [192.168.71.146] ([240e:b8f:91e2:d400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39451sm10720102a91.7.2026.09.04.05.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:57:59 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-scsi@vger.kernel.org,
 sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH RFC v2 1/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED
 driver for ROG NVMe enclosures
Date: Fri, 04 Sep 2026 20:45:00 +0800
Message-ID: <202609042045.ReplyLee.lhw@gmail.com>
In-Reply-To: <20260903161357.GX2133376@google.com>
References: <202609012200.RFC0.lhw@gmail.com>
 <202609012200.RFC1.lhw@gmail.com> <202609032000.RFCv2-0.lhw@gmail.com>
 <202609032000.RFCv2-1.lhw@gmail.com>
 <20260901145204.2BF551F000E9@smtp.kernel.org>
 <20260903161357.GX2133376@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 3 Sep 2026, Lee Jones wrote:
> Please review, explain or fix the Sashiko review(s).

Fixed, fixed, fixed, false positive, false positive:

- [High] empty work run writing flash: real. The work now snapshots
  the dirty mask up front and returns before issuing any SCSI command
  when nothing is pending.

- [Medium] name collision between enclosures: real. With the static
  name the LED core would register a second enclosure's LEDs under
  renamed nodes (led0_1) rather than fail, which is still the wrong
  device identity. Names now include the sdev's H:C:T:L, which is
  unique per enclosure.

- [Medium] colour write vs dirty bit ordering: real on weakly ordered
  architectures. A per-zone spinlock now covers the colour cache and
  the mask on both sides.

- [Low] blk_rq_map_kern() argument count: false positive. The current
  signature is (rq, buf, len, gfp); drivers/scsi/scsi_lib.c calls it
  exactly this way from scsi_execute_cmd().

- [Low] kzalloc_obj(): false positive. It is in include/linux/slab.h
  since v7.0.

v3 with the three fixes follows. One question in its cover letter:
whether deferring the Kconfig/Makefile/MAINTAINERS wiring to the
agreed SCSI split is acceptable for the RFC stage.

