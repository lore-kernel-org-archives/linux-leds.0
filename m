Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641103C819E
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 12:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476551; cv=none; b=qKJNzr+SuE/+DPjwX/+iN5+pe2CFOVj/EKYJQ9fKHxWvUBu1mVCS+lUC9OuVEaxghZQNfcIJ3LONHZPUpEHOl4N6n3c/l3aa0/kyHvVf6nH486CqYurN8ka8Gi/cTjLLTVmLqa8hk4xFAbVDUjV98jxxJuShV4+I/bQoBgHOD4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476551; c=relaxed/simple;
	bh=hjF5uq4+rnXMZsq4PdMN+lhsdpK+neGjIFKdjIdf+8w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=WcNoa9KM6g7LatwdcE19KYoets1XC0e2P07EkHMKDm9r9jUKB0J1MDxSp+aPV6og3RBiDfdFQkWUCNZ0KpdiHAQs7gAeioipeGRiJnijd/A0ce4ZArF0it7bFwERd5XbK11IO0rBPWLzETjRW4LRda154YR0llxpMQp4LVlaRCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JOOARdHK; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JOOARdHK"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so2434629a12.0
        for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 05:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789476550; x=1790081350; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hjF5uq4+rnXMZsq4PdMN+lhsdpK+neGjIFKdjIdf+8w=;
        b=JOOARdHK4zBGCfoAZZPJV19GXznCctp8XRRWXg1F+REhUejU6SPsn6B8nKNB0I+mPC
         /qV/wUTsgSHCSusEuyl3LkgYfqmHOhUxDzDeEttvCiwkb6tDBY5iTlMnPXmuwslL+4Wn
         zeYBhl0PEK7wwRfXtYoqU4NlRfufvPzungXlAakwrcqtx+p16jhnnNBslkS+xibrSDTp
         tYgy0fwSuKGbFRIWBm3aBgf0z+CBZUfoXI/DW2SOKhG+TiqvELVGQvFSu6GgkbI9fP07
         gI0FJcSxgZAX/NUxT+Iis7YUtpzTuq/5OvXa/0IoK0fdpD8KtQduGZSvEsikGzcYE6PI
         x3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476550; x=1790081350;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hjF5uq4+rnXMZsq4PdMN+lhsdpK+neGjIFKdjIdf+8w=;
        b=hqKrtlheKwJEXh3L1EksoWhvjDMc0FUflMstOCZDfRWzOIzoTJ1J5+j64Tko4GXSlh
         t7X3f9WtNO6fGBU9P0Za5x4+mDxIfl+dLVGL6V0OD7KxOTDjrQL61U4Q2GtYrLggbwG3
         wqo8GltxsZygS6mXzUU7Pt0c58E0q8VuRoo8bUzLjJgafA7nh/K0PXoKEvSokRoq1/Rp
         ew2Y/8rLNSZSZshhjeIsYnNW6XWiNZkU73aIAIWNvPkBKL8wAmu1+mzwaqMfwC+uOSPT
         vqi7Z0cP46RZc2zfRw6FQt7hJSaHA2DSe3JLqimyelk3oaTf0MjD1FUHsFcCv48tDn52
         r/2w==
X-Gm-Message-State: AFuF++nMEkyUis4MsYvMDakCA2tM7Uez+WX3lny38DXRgtO5Jjw0j/SU
	kP/PWzM0E9c3DXAThwsjc2z/r3SCtRmxG4jH4jTLfQEcQ+TpR3AM2m3e
X-Gm-Gg: AYBFou0vR2ZiB/nViFCamA//Fh/ptjvi0BYPpLL+xR8yYoK1CqqVbugWCvkEiwBUPml
	P3g0vxpbGLbojBdw6+RiKei2DMjFEQwsJiLh1j3D3l9UVt3d9zQYTzjbJ6/i2B4zQSBL9kMpTHj
	mabsmBWb7t3i9LjlU9k8dTTKzvQp1kg04hJsYaAbl61XDrdJDpEoENSyaYByqqpHNQEg7b+oiAz
	wsZ+GXd+BoXHLNVxyhnk02g0kbd3iLKngiUdOOtNmJ2xnOgN6uBAn43hakrixU1D8Aoa6iemUcb
	rex4dvkW0aj+LHmhmiJT8z2r5O6DBNebBS9OmG1iBeXq5fPUuornBCSH963TggZBhgUQXZZJzcp
	VXgumMA8is9QtLhcUFsekWSsfeWPYuLptt6baDhmcrlY76SKvt1W5xtv2cNku/BEKnFwJJC22Jf
	5gQTjA+gB2WVJTB2XYtvJqC9QU+0kgHdsp6PYEaM/Bq0ieP51NOxinAbCpJfI4R37FphKmzw==
X-Received: by 2002:a17:903:320e:b0:2cc:864b:539 with SMTP id d9443c01a7336-2dd6c5eebcfmr170674595ad.6.1789476549474;
        Tue, 15 Sep 2026 05:49:09 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:91e2:d400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd48ae3cacsm52866095ad.26.2026.09.15.05.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:49:08 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH RFC v3 1/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED
 driver for ROG NVMe enclosures
Date: Tue, 15 Sep 2026 12:49:06 -0000
Message-Id: <202609152112.ReplyLee0910.lhw@gmail.com>
In-Reply-To: <20260910093232.GO2133376@google.com>
References: <202609012200.RFC0.lhw@gmail.com>
 <202609012200.RFC1.lhw@gmail.com>
 <20260901145204.2BF551F000E9@smtp.kernel.org>
 <202609032000.RFCv2-0.lhw@gmail.com> <202609032000.RFCv2-1.lhw@gmail.com>
 <20260903122408.3CA6B1F00A3A@smtp.kernel.org>
 <20260903161357.GX2133376@google.com> <202609042000.RFCv3-0.lhw@gmail.com>
 <202609042030.RFCv3-1.lhw@gmail.com>
 <20260904131503.355C41F00A3E@smtp.kernel.org>
 <20260910093232.GO2133376@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Understood, sorry about the threading. v4 goes out as its own thread.

On the three sashiko items: the naming one was a real bug, the LED
names now flatten the sdev colons to dashes
(asus-arion-0-0-0-0:led0), so there is exactly one separator again.
The other two are false positives: kzalloc_obj() has been in
include/linux/slab.h since v7.0, and blk_rq_map_kern() takes four
arguments on current kernels, called exactly this way from
scsi_execute_cmd() in drivers/scsi/scsi_lib.c. Details in the v4
cover letter.
