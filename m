Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698BF471CE0;
	Fri, 16 Oct 2026 10:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145151; cv=none; b=kB1x7BJsAUAjeiCnWw7gqffgWVauOhmaS3+baCA4/zshU2qpjsLOEx4i0JLzzFYiDsJdYO1t5Jgl7Wqu2F/qVu1HokIysrfvKMqyQd+7csr/meA/VkCJjCXAo7OZfkh0INxzbrpissyG9KkKM3vhmt1Uf5SkT/VFRidR2NMk1JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145151; c=relaxed/simple;
	bh=I0tA1GmRBeMKbGhGvVcrGI33rN8E+MZQodbKIVQF3+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fD5Th78j7Xw4efgZo+IF94MniAlmTgG6sTXV5WFurBvVJcmf3HJZdhQTg5rUPP3n/VC+nf+p5hjTurfs1Wq/gKpzvuaiYbWIh7BMFJ0a/WmQW844/+SCBLmpD9W18RCnyoGCrXjjIdRpz8o0u0o1F66F1/Zq038OeKVbrX07TIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=T3HL+19E; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="T3HL+19E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=AG
	/G2jTHLJL3HM12FlhdzuebFvon4l4oP56M8P9835E=; b=T3HL+19EgOqXkImTJU
	p0UD6YeWQqAs7991MJ6hLf6cnZqrrUHwIxuDgttNO4PkvKQpZtXjubIjiZKeoxa0
	e1VJ1FAE/CckAgcLtHbRUmeMc/utryRAh1AJpU4HU5O1EFBxj5sekH6e6TYolV8F
	6KT+i9eii4SyZ10cMxVOcLJIQ=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD332+29tFqQfLjAA--.14422S2;
	Fri, 16 Oct 2026 18:04:39 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Matthias Fend <matthias.fend@emfend.at>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 0/2] leds: freeze delayed hardware access during suspend
Date: Fri, 16 Oct 2026 18:04:33 +0800
Message-Id: <20261016100435.2581303-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD332+29tFqQfLjAA--.14422S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw4fZryDJryDJrW3KFy3Arb_yoW3Wwc_ur
	97Cr97K3yqgFWqga1IyF10vFWrCa4j93y8Xan0vry7trWxZrWrXFZxXrWUA3yDXFWjywn3
	WFs0g3ySywsFkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_oGQ5UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzhf5NGrR9rfgnwAA3R

The TPS6131x torch watchdog refresh and CR0014114 firmware recount
callbacks perform bus transfers from delayed work. Both callbacks use the
non-freezable system workqueue and can run after their I2C or SPI controller
has been suspended.

Queue both callbacks on system_freezable_wq. This freezes their hardware
access before device suspend and resumes it after devices become available
again. Each patch is independent and can be applied separately.

Jiale Yao (2):
  leds: tps6131x: queue torch refresh work on freezable workqueue
  leds: cr0014114: queue recount work on freezable workqueue

 drivers/leds/flash/leds-tps6131x.c | 11 +++++++----
 drivers/leds/leds-cr0014114.c      |  6 ++++--
 2 files changed, 11 insertions(+), 6 deletions(-)

-- 
2.34.1

