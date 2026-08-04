Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486792F7EF7;
	Tue,  4 Aug 2026 03:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785812633; cv=none; b=Oa9J05Z0EGpvTzN+08eStsWJTwurK6SmutTEDxb/djjv7gT3k4Eg3j0BMlXu4m1rhiR7lTJmFljIfVlVigB3afOyL3JaFskNBnsl6BbioylMQFmATZghi9LZZ+74sKYvhfuO99mpFjWhchJpIFLDS0QrDoQsIAIqnSLQ46lpdE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785812633; c=relaxed/simple;
	bh=zBgFjVb0u5RrsyB4ut0G9ucJzEJ84Bcty56oUypQ3tQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X3oc60f5ZCY3U+gVoEYKoA7KQz5NF7mIXxltIKfGzdYZsL5pPOoN5GcU6fqvyUeW5aiW02gD0oM8Xg31XpJVG1WRD1gkFDeOifW71QDcH5zeoWsTnDLyHOeTFTUNtSECe4JOmsLqPAhPL70AuhNm1CymXeWmhYd8S4CI3ALha0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YYzf9VYS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YYzf9VYS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785812632; x=1817348632;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zBgFjVb0u5RrsyB4ut0G9ucJzEJ84Bcty56oUypQ3tQ=;
  b=YYzf9VYS2/jKWevgXctwyIoXGxFJNMWedGNrXW0PIARNLdJ2CH5NjbMz
   JvJIdZNdz4HQVzXVh/5+y3czjHWNMQaEOFPXB2Yqv57jhuMQU0F3RrvDg
   U3IyQFAgnmeZkIYW8SQcaqUCW2FkIGY4RB2uSd/n7qTU+qHGmVvTfpAWR
   LBNcq/n8q682xki7Sl62a5Q+Gqo1FNBjGOS35NkM/JxTik/6bPUdS8GrA
   oShXirvAz3c9/3U2HU3UTt61aTPFgR/sGNin4dvraieTn3o858EBaYZid
   2CKkl97A2VZYk5RYOoHSSxGXW4RDwQNVt9N9LL25drtJ/NFVjiqhNCq5I
   Q==;
X-CSE-ConnectionGUID: 5ZMhKW9oRVa1pqr5SxZWMQ==
X-CSE-MsgGUID: KN7wR/RVQ6KgWXAiGPuNIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="103759409"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="103759409"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 20:03:51 -0700
X-CSE-ConnectionGUID: elwemsHdRtW2OaL5SIIscg==
X-CSE-MsgGUID: A0PJ4RCnSXWj4FGXoQdkRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="260139919"
Received: from junjie-desk-dev.bj.intel.com (HELO junjie-desk-dev.tail2c02c1.ts.net) ([10.238.152.71])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 20:03:49 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v3 0/3] backlight: aw99706: DT parsing and blank state fixes
Date: Tue,  4 Aug 2026 11:02:52 +0800
Message-ID: <20260804030255.1934470-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver reads its tuning properties under names the binding does not
define (patch 1), the validation paths accept values the binding forbids
(patch 2), and update_status() ignores the blank state, leaving bl_power
inoperative (patch 3).

v3:
- patch 2: reject 0 for awinic,sw-freq-hz (reserved-slot marker
  collided with it); add Fixes tag
- patch 3: add stable tag
v2: only patch 1/3 reached the lists (outbound mail failure):
    https://lore.kernel.org/all/20260803141310.1379194-2-junjie.cao@linux.dev/
v1: https://lore.kernel.org/all/20260701133918.33487-1-junjie.cao@linux.dev/

Junjie Cao (3):
  backlight: aw99706: Fix DT property names to match binding
  backlight: aw99706: Validate all DT property values consistently
  backlight: aw99706: Honor the core blank state in update_status()

 drivers/video/backlight/aw99706.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

-- 
2.43.0

