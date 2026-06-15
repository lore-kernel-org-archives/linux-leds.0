Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0D23D47CB;
	Mon, 15 Jun 2026 15:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781535799; cv=none; b=r7HmlTmggubPIWxxS8Y/EdvNVzhA5cLO45fQ5Q+hXUsf6Ir4vc2H6VHBXNTgyCJjoH6MoSFAmSnQf1+KjGhg38/z8Lwl+6YczLrETMrqy77X67MiSaqpxGIJR7E1ikMnFll7tp36se0RmOEZI5N206Hh22W1CGHZpN6F6OpPYvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781535799; c=relaxed/simple;
	bh=nsgS6jUJwWgsotbeDk3JAyb0rxrYLc5/xufoXFsY2+8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XTMEMnE0IgI6cnbDzk3sPYd/ide5/NuvkUUdGTcAtCN9bhEwFa1wE0Wf/mq4R3PKS4p6ZUxHiX2DSkPXM58jr17q1RLfTz7YVLIza+8T3l4biXvXPZv72UA39JhPctjTKYNGUiIQ+DTEUMuwS0Ped0NN5CNA3w5C94ubwJewsyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=LRBb+EuU; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="LRBb+EuU"
Received: from PC-202605011814.localdomain (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 42733caaa;
	Mon, 15 Jun 2026 22:58:01 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org
Cc: Andreas Werner <andreas.werner@men.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shreshtha Kumar Sahu <shreshthakumar.sahu@stericsson.com>,
	Bryan Wu <cooloney@gmail.com>,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	runyu.xiao@seu.edu.cn
Subject: [PATCH 0/2] leds: use brightness_set_blocking for sleepable callbacks
Date: Mon, 15 Jun 2026 22:57:54 +0800
Message-Id: <20260615145756.1019184-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ecbca1e2e03a1kunm9a9f3cac5b33
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHxhPVhpIGUkdH0xITkpCSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=LRBb+EuUVJ2XxPjsb6COvr5bFIFIX17tFsD0fNOq2pv3/6GxfGugD0lu7znu6hDiCgfd6yqXazsf902jrlI0EmysxyvcV3/sLAoK2PK7s7Lvd5/qQzMXUlpsQKEC3RxyuyRJRUYhfhUVVQB1MObO4ox7jqQTAU/hjRRcE3rHcHY=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=RcKBKU/uMyJIyWMksHDg9BprF5+N+qeUp+jgWVKUb/o=;
	h=date:mime-version:subject:message-id:from;

This 2-patch series covers two LED callback contract mismatches that
were found by our static analysis tool and then manually reviewed
against the current tree.

Both reports preserve the same grounded issue: the callback may sleep
because it takes a mutex or performs I2C transfers, but the driver still
exposes it as brightness_set.  The corresponding PoCs keep the original
callback names and transport paths, and Lockdep reproduces the same
atomic-sleep class in both cases.

Patch 1 updates lm3530.
Patch 2 updates menf21bmc.

Both patches are build-tested and checkpatch-clean.  I do not have the
LM3530 or MEN 14F021P00 BMC hardware for runtime testing.

Runyu Xiao (2):
  leds: lm3530: use brightness_set_blocking for sleepable callback
  leds: menf21bmc: use brightness_set_blocking for sleepable callback

 drivers/leds/leds-lm3530.c    | 12 ++++++++----
 drivers/leds/leds-menf21bmc.c | 18 ++++++++++++------
 2 files changed, 20 insertions(+), 10 deletions(-)

-- 
2.34.1
