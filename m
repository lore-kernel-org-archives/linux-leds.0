Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE6146A5FD
	for <linux-leds@vger.kernel.org>; Mon, 14 Sep 2026 13:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392265; cv=none; b=LTjtWl5jjN6sHsrzYCQvs/nsk0ngoAB/Jm8NRhNbFNyfaQ3bZJykmcP+2yj1z35rk8HWA5ANrhkUkUqH6b9/t8lNE0KQJF8vLWGKvmS4U8Vt/TkP9t0LEec07+26OkI+Gp3B2Ttw0D2yaTNwxMvGoLc++RQLevE5caGgF3F8Vsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392265; c=relaxed/simple;
	bh=ZRyRZwHqmaIeKhF8DBZsJx2hVPfAjKqARrJjthV5Ouo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PbnWIVXJ9hZF1FEKaMJXPbHHTgZA5ciVMHWqZfL2zKdPNeQhxtudYGE7MaRpYallwjYg+DxF5a4jnGmzrjEqeCDLiV8nFfze7FNF4qhBDtZNA4G01yUNB+vvFpEzIfB7Yzd9PXzSOzlLDtHTuQ2mUNx5/Dc692S+1XE/ZSsAvKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=rij8mg3r; arc=none smtp.client-ip=185.136.64.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="rij8mg3r"
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260914132413dc7910537a000207aa
        for <linux-leds@vger.kernel.org>;
        Mon, 14 Sep 2026 15:24:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=nU15p1Uo/GMZ1ItptzKGpIg4lZVwwfXFaJxNjP/Pnn0=;
 b=rij8mg3r5hjwtffRcjdtw7Z4EH6YJKqw1GHu1L4x1o/iM/ZqAJZ6wwFmhOx6KCIgT1uegZ
 kIzIU/tvzgJP8ZfVGQ1nOp1KGCcEW8N35O1HCrMYFMBC5DS5tdNzj1o8Z7e/aAXpdWqlxKoq
 CZiTFWybiksJm92V7dGeDAZTr6tuUa+YN2OiPsjINBSDIevgNHus8LnKWB6QrwVOyEFNLii1
 Ux9oFQmLLa8KyAL7pPWMUyiwPE2xKSnNL3gKZiN5FUkW/Vx5RH9XUfuRnTXq/kMSR6Xnvwy+
 yccHWwEr3bVgZ/BNhelA8+gjcaoECTFlhdqechSu5K3sgEt7Kd6lP1sg==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-leds@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] leds: trigger: netdev: hold lock across sysfs_update_group() in device_name_store()
Date: Mon, 14 Sep 2026 15:23:50 +0200
Message-ID: <20260914132356.807004-2-alexander.sverdlin@siemens.com>
In-Reply-To: <20260914132356.807004-1-alexander.sverdlin@siemens.com>
References: <20260914132356.807004-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

device_name_store() calls sysfs_update_group() without holding
trigger_data->lock. The is_visible callback reads
trigger_data->supported_link_modes, and the sysfs group modification
itself is not atomic. This races against netdev_trig_notify() in two
ways:

1) Concurrent sysfs_update_group() on the same group:

    CPU 0 (device_name_store)            CPU 1 (linkwatch workqueue)
    -------------------------            ---------------------------
    set_device_name():
      rtnl_lock()
      mutex_lock(trigger_data->lock)
      [sets supported_link_modes]
      mutex_unlock(trigger_data->lock)
      rtnl_unlock()

    sysfs_update_group():
      remove("link_10")
                                         netdev_trig_notify():
                                           mutex_lock(trigger_data->lock)
                                           sysfs_update_group():
                                             remove("link_10") [nop]
                                             add("link_10") ← CREATED
                                           mutex_unlock(trigger_data->lock)
      add("link_10") <- EEXIST!

2) The netdev_trig_link_speed_visible() reads supported_link_modes without
   the lock, racing against get_device_state() called from
   netdev_trig_notify() which modifies supported_link_modes (a multi-word
   bitmap) under trigger_data->lock. This can cause
   netdev_trig_link_speed_visible() to observe a partially-updated bitmap.

Fix by holding trigger_data->lock around the sysfs_update_group() call
in device_name_store(), matching the locking context used by
netdev_trig_notify().

Fixes: 06cdca014eca ("leds: trigger: netdev: Display only supported link speed attribute")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/leds/trigger/ledtrig-netdev.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 5b4e92c14dbb4..354d3b640fa53 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -336,8 +336,14 @@ static ssize_t device_name_store(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	/* Refresh link_speed visibility */
+	/*
+	 * Refresh link_speed visibility, serialized against netdev_trig_notify()
+	 * which may concurrently call sysfs_update_group() on the same group
+	 * while reading supported_link_modes via netdev_trig_link_speed_visible().
+	 */
+	mutex_lock(&trigger_data->lock);
 	sysfs_update_group(&dev->kobj, &netdev_trig_link_speed_attrs_group);
+	mutex_unlock(&trigger_data->lock);
 
 	return size;
 }
-- 
2.55.0

