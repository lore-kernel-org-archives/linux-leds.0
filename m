Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4EB381AEA;
	Tue, 31 Mar 2026 18:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774981861; cv=none; b=Qjrlb7GQ8dJ75DRHmsDJ75mmU4pJ5EZSgvS+AqnTlW0n5c2ZFKLyhNSmWUQzlk7PYVq4wJgGHcCEHwIveKMuQ0zjd3C9inS6Y2B+x1AgIGzxReo9I2CGjKUovZ+bq34skJ54yKQK4qdG82Dh3ejvJnudgtAIGezFKJd2JI/9FsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774981861; c=relaxed/simple;
	bh=522hjp91dw7JR1XgDkg2FMoJVtGsvvmKWbIFx5YybA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oAmt8yljfL2n8muO3Ofoyc9CzBrSlk2pFlvnDPlw4mV1AonlW/8wJuxnkeedcBjjZAbAQs+2401+aETXgfcta6doniZ7xTDVlSh+jC3nhWcZIBY62i7/6DgG4m3jZHpLP1TIm7Dhe+wL+Bc9aPvjNZMT9mHkHD1u6q13UCBDYDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eFdVc/BN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eFdVc/BN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774981860; x=1806517860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=522hjp91dw7JR1XgDkg2FMoJVtGsvvmKWbIFx5YybA8=;
  b=eFdVc/BNLgijBqV1ez4+6N+R28526sIwkNSxcY7a2dM/WpKfGdb12N7u
   qTx0bhzNA05cLR6GG9yFW2f5Nf1WvIuzOgrT+tGPBMQ+0bSEsbd1Tv09U
   0DqaKL+cR3A83UDNZW0QyJI7A3LgX+ImgzuoGYKDZ7om5sB5uA7iHiUBP
   +DFovk1KuB6i1529KI6yVxCdLP+ZBOnB3fodPxwFVOl7thzvZ4hfen/8L
   mGfFSP588JukijvPl7l+fe35o0ai76gPORe/qnpI4ubIE79Tjg0qZUJR+
   D5eDOAwlkhAF9GTgyklHnHURpCJJHePs/YjaeuY+p7VNKOrltHqkXfSLc
   Q==;
X-CSE-ConnectionGUID: 5OKx+2BXRPaEihJgGQe1cw==
X-CSE-MsgGUID: vlkvbuwlSJ2jN0Lg4D+5lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="101459634"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="101459634"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 11:30:59 -0700
X-CSE-ConnectionGUID: QTJ0liTJQ9K4rZgkNk7jIw==
X-CSE-MsgGUID: o45z7g0fQrSV+ZRFkIfwGw==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 31 Mar 2026 11:30:57 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 63CF798; Tue, 31 Mar 2026 20:30:56 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/2] leds: class: Make led_remove_lookup() NULL-aware
Date: Tue, 31 Mar 2026 20:28:28 +0200
Message-ID: <20260331183055.1209526-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260331183055.1209526-1-andriy.shevchenko@linux.intel.com>
References: <20260331183055.1209526-1-andriy.shevchenko@linux.intel.com>
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
index cad55e2beafa..b53ebe3a0faa 100644
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

