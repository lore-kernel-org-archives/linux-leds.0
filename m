Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831A23A3802;
	Tue, 10 Mar 2026 16:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773161515; cv=none; b=h9GMYkw+wu73N/0KTnrM6lfFn/s+QarMjIkZRW9fsPqutDqX/wTp6w4lnlnS9HEGyHTMmROsg7Qz/teXNkFMBZa4HhWXVU50x6jOg1d8rGqWDBbZTwt6TkouWQuaqOeaEsce3IOB8lppgctQ2iBZ3RdAGkgQnrswkKAk+HRaDAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773161515; c=relaxed/simple;
	bh=CzGM+nzkTttW4FLlsICJ15RvQkzFyKlV0ZAupkCXvZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eZpnRT8drB/WwAAuWppWESjQfd49JlWcFh4/vN2V0Byk41fi7PjS1z/wOhmgfNNGhCYGk72XY3b5FP8FfKzl80B52xR68pSKRn4VO9/Eg+ZDfMFPW7j5C8PT2UAAa299+mxaTJleB1QsE8nj3HplJVV4odYETTavjBy8JlFtr/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJBIDt9u; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJBIDt9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773161514; x=1804697514;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CzGM+nzkTttW4FLlsICJ15RvQkzFyKlV0ZAupkCXvZw=;
  b=fJBIDt9uCgyyv1OjCv8yedRWx0ixhSBJQDWolB6vngrEh0KY1Nne1VL5
   wE9viH5/XDJawG9mZ2uC4+da7N1dBu/AhMfKI2TQBraD9VKTf6HPARAKL
   +Zeyznx8O7HYGxDHIPRqI5YKMelDY95UDKDvaR+O0IGc6/tNsAftDurNQ
   6ZghvxdTG1jgo/VFFuaEzU01Cd7OVSamqhwOSqHXp/Nwtx86YCUiAjuB1
   mjtMrbMHgvfJVVokkonS1uciQ9kBTP/tZFpHJklW1suzY+irEZ4E8090W
   WpNBu8ofFUBOhMgybWhUqJTF/pLRPu3lkgg7FdMy1O+/d1vYo/dABt+MQ
   w==;
X-CSE-ConnectionGUID: c4231AehRYe2gVueUJ0PYQ==
X-CSE-MsgGUID: wh5l+vilTGKpevUF1HTD4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="78071514"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="78071514"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 09:51:53 -0700
X-CSE-ConnectionGUID: A/0q9SG1T3evv7lPsuwr2w==
X-CSE-MsgGUID: vGFFPR7bRoKjzjmi40kgog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="220227235"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 10 Mar 2026 09:51:51 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 8C81D95; Tue, 10 Mar 2026 17:51:50 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Craig McQueen <craig@mcqueen.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: Michael Tretter <m.tretter@pengutronix.de>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v1 1/1] leds: Adjust documentation of brightness sysfs node
Date: Tue, 10 Mar 2026 17:51:43 +0100
Message-ID: <20260310165143.354065-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust documentation of brightness sysfs node about accepted value range.
The code accepts only decimal values. We may not relax that due to different
readings for, e.g., octal 0100, which becomes 64 instead of currently parsed
100.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/ABI/testing/sysfs-class-led | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index 0313b82644f2..39ac8453e670 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -22,7 +22,7 @@ Description:
 		  For additional details please refer to
 		  Documentation/leds/leds-class-multicolor.rst.
 
-		The value is between 0 and
+		The decimal value is between 0 and
 		/sys/class/leds/<led>/max_brightness.
 
 		Writing 0 to this file clears active trigger.
-- 
2.50.1

