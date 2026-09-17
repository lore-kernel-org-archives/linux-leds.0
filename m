Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73F74E0B9B;
	Thu, 17 Sep 2026 21:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789679640; cv=none; b=a7ggjTQhVAGTce/f8KasFIJioYSQQXkt2UQsKrNFa7ANSBtchEHw+/97s72X7h0NzXrwKOb2HGeGzppg9j41LbakIOBaFSavucRyB3myFy6al4OorX0k0LW7ov0OhtUeHPUW5GprI+BFZ0kkqPUd98fUFzGRjz3dyV9bac4xdPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789679640; c=relaxed/simple;
	bh=ofEJ47tNLt/HFtg44TmVSsWDDo+tRcQPsX3AIjNqt1c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=I0OqHcqblmOUCmXasak88y1s7L5KBux0l1qiaJNKmdWGTX8IEwT8wa1xHoA/jm/6FEPJGDWaAzfPD0GIa8IJeQfSmlvEc+Gqrj0QLpkmhwxHP7LVhASPAjVgCnRBQwA5holLw4/Ukm0HMXc/+D8P6SPs2OaHFtg0rpkJ3ZL9Z5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dt17S+ou; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dt17S+ou"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4DF1F000FF;
	Thu, 17 Sep 2026 21:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789679639;
	bh=OE+Wj0fpGyisw2MXJpbTjlrIt2+GcxdlJZdBx5zr86c=;
	h=From:To:Cc:Subject:Date;
	b=dt17S+ouYGQbqjcS6GHZQBi+auFgrqqZNznjwkFeAaPSDFN5f1Dg0Y07BiWq+tIkw
	 aQHmtzuw6gja6UCNHu2WhVYFbaPUU8vFSYDchL7sZQN8ifpMDwHA1YV6ITr7pehDZn
	 ax58m71NtiO29XtlnJKT/cVrVuavvWT+rCSChbMNqIfJg0V/IutlAb2TMoX0AgAc+L
	 ol/hlc1ZUkfhaQCjeOkf/Lo6FeROwdPJS9pYu5rdyzh39u2Glu+t70oy73GWVgbxcP
	 5KAbNj6L69T3I1JO/WLjKxAXRwK0bTibCCp2BMhneftdrEM1CfnuAyBOCN8+7pyMC4
	 jUKu+DEWpcezQ==
From: Kees Cook <kees@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] leds: aat1290: Allocate mm_current_scale with ARRAY_SIZE()
Date: Thu, 17 Sep 2026 14:13:58 -0700
Message-Id: <20260917211357.i.412-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1909; i=kees@kernel.org; h=from:subject:message-id; bh=eGGHpkaMaK90I/Wg0MunopjNv0+PUxvjzTZDxaTFuX0=; b=owGbwMvMwCVmps19z/KJym7G02pJDFlrIkSPzKn+e1D71sEjJywkG5iZRKO/TAw0VLC+qHLIx qn5Ju+vjlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgImYXGNkWKvBKz71ZfEOYSkb pu0fFNWEzVvKM/6FfS3lK+ROrslUZmT4tVNevn3OVutllxuWNTYoxXayt+28fGm+jLUGO7NCyyl WAA==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

From: Kees Cook <kees+treewide@kernel.org>

In preparation for making the devm_kmalloc family of allocators type
aware, we need to make sure that the returned type from the allocation
matches the type of the variable being assigned. (Before, the allocator
would always return "void *", which can be implicitly cast to any
pointer type.)

This allocates one int per entry of max_mm_current_percent, but the size
was taken from the whole array, which would make the allocation type a
pointer to the array rather than the "int *" being assigned. Allocate
ARRAY_SIZE-many entries instead. The resulting allocation size is the
same: AAT1290_MM_CURRENT_SCALE_SIZE and
ARRAY_SIZE(max_mm_current_percent) are both 15.

Build tested ARCH=x86_64 allmodconfig with GCC 16.2.0:
drivers/leds/flash/leds-aat1290.o

Assisted-by: LLM coccinelle
Signed-off-by: Kees Cook <kees+treewide@kernel.org>
---
Cc: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>
Cc: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: <linux-leds@vger.kernel.org>
---
 drivers/leds/flash/leds-aat1290.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/flash/leds-aat1290.c b/drivers/leds/flash/leds-aat1290.c
index 49251cfd3350..4bde0b07fe78 100644
--- a/drivers/leds/flash/leds-aat1290.c
+++ b/drivers/leds/flash/leds-aat1290.c
@@ -311,8 +311,9 @@ static int init_mm_current_scale(struct aat1290_led *led,
 	int i, max_mm_current =
 			AAT1290_MAX_MM_CURRENT(cfg->max_flash_current);
 
-	led->mm_current_scale = devm_kzalloc(&led->pdev->dev,
-					sizeof(max_mm_current_percent),
+	led->mm_current_scale = devm_kcalloc(&led->pdev->dev,
+					ARRAY_SIZE(max_mm_current_percent),
+					sizeof(*led->mm_current_scale),
 					GFP_KERNEL);
 	if (!led->mm_current_scale)
 		return -ENOMEM;
-- 
2.34.1

