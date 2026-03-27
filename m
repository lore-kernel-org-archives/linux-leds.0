Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8084A32E692;
	Fri, 27 Mar 2026 10:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607256; cv=none; b=GMDMBbg6PDIrLaiT6bf9bezIcTTs+1ksjIs02Uy5E9ebrEKK2GQHJaMtXjMqSz/H5LB8MbhjAxyaAJ7o/9LsQeTXl3Ugq4mniu9jmVtG2ft83b+penldImh1D4S8qcWMOpVGser926CJ+w16Wao6MgskirY/z+8HYU52qSEXC/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607256; c=relaxed/simple;
	bh=RdAmQHZtejp8bSyBKfDlAjct6NaqMd7FXuFd+2c9C3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ViW6ZogMsDbuugwJutrBBDgfpr5JC0P2+XgBCMoShSJ4ollnSD41rF6fFAlwWidau+EN+SqRTU79mUFz9NNO8W4+P0yBkpRaVB29XCYjcyD9RcL8566Ujy2xX9VHrlu4TuOvBKh8+oSXjMcbgLFkAeBYWwiTGE1MCNyIRItmcAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BYzeb1QZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BYzeb1QZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774607254; x=1806143254;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RdAmQHZtejp8bSyBKfDlAjct6NaqMd7FXuFd+2c9C3Y=;
  b=BYzeb1QZl5q7Dn7AmoLNL/SrRpj/bHEcilAwNWcOZQAYYvoYLGi/NZv5
   EEMVvqr4ZkTuYTzYFsh2amFJ42ytwIruBKG1WPD5Xx/wbxDfFfJbJbKRX
   SueRZnwcm3jqcXvxEp5R6RC3bCEAQBE8v4plLa4TAEQHbM2HFd2oGjq9W
   P+N13f3yk+5Qz0UK3sxAzAIlHRdqfQkCTVirJUJ1kgcikPd+NtsD1Lh+S
   CN6YxkAM5eJSobevacWQcygttt5VU63qLGCUcyoF1UTcQNV6oWS00H9M8
   6flW01yUdBhZWVSmHa667fZO4lZqxNOjGbvR1ZhDmZHCyuqCRXrSDt0bg
   A==;
X-CSE-ConnectionGUID: tLvXqlYoT5atplR/8XFyyg==
X-CSE-MsgGUID: qVjSibCjS0qu7xehjDnqQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75793748"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="75793748"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 03:27:33 -0700
X-CSE-ConnectionGUID: Pl8xfCdkQ3eJs25S0DO/RQ==
X-CSE-MsgGUID: lMGFBEuCT5GzYb/UJN09+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="229360822"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 27 Mar 2026 03:27:32 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id B508898; Fri, 27 Mar 2026 11:27:30 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] leds: class: Make led_remove_lookup() NULL-aware
Date: Fri, 27 Mar 2026 11:27:29 +0100
Message-ID: <20260327102729.797254-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is a usual pattern in the kernel to make releasing functions be NULL-aware
so they become a no-op. This helps reducing unneeded checks in the code where
the given resource is optional.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/led-class.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index d34a19453560..172fc44bb602 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -421,6 +421,9 @@ EXPORT_SYMBOL_GPL(led_add_lookup);
  */
 void led_remove_lookup(struct led_lookup_data *led_lookup)
 {
+	if (!led_lookup)
+		return;
+
 	mutex_lock(&leds_lookup_lock);
 	list_del(&led_lookup->list);
 	mutex_unlock(&leds_lookup_lock);
-- 
2.50.1

