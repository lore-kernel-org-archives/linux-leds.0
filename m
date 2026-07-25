Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083B937BE72
	for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2026 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784967250; cv=none; b=Ub2AK7q5ieWy0gssEn64VTkR2zYeCLE05Doub2TWdK2wZW6+JMK2+4AIQlaV2IcJxqF2FC/04MEtuZ/lYEhbht9ZGSPGNZ3HrcMyiHB/x/fTNrYqq4v8RbRv/0GIn0lR+j9qfsM/JDO0P7XcOw+HGNF16C1vjRxHaUxiEFLj3Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784967250; c=relaxed/simple;
	bh=2YFErkEfWTid63HWff5+u2dUjlWzOX6GXTUxwvfYZsA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gQheU+uDZrV/wWPlIHYC1e1J1nFzYus/l/C/59U04ZGAOHWNf701/+OFFbyYwcjCoqUxfwFAlX0bACyOIfowq/YHRW1eWt+E4mF1dc0o0KroyRhxFOkdt4SUfB1SRMWu4/nlSWuxelgUjyYibKAthEGBZZR4x6TxZJzFtBHfV44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bE4b+XDg; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bE4b+XDg"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso1245330a91.2
        for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2026 01:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784967248; x=1785572048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ttGVBBLV5S7SFqtsKUPChZqO8zfT3Rb+MVyL1uhuCco=;
        b=bE4b+XDg7p5+ZYfZBtYqhLDCz8ooJb2v/p01eNZaetcxuQic5csLyrVd68+T+pESmF
         aKZ3yYRBJGQUv9xrOO+L+MI9qE7N/bXQDri8fJ1qDw0FuPAEwVfyOoFjik3C48q3Tpku
         8QDRSS3n1yumTXcFuJ+Zgf4ExcAhyhWlQ3o4QqZcsdw7njNdh6RJ61NLwokQ6imPwOle
         EumD8YU2QB4g2rma/p8JOLfgwJmekD7oSZKKqlyx3GGgovNMztpGylbknW7W8Xk7e5qf
         3lyTFm6LrO/VwkcDXr6UB0y468g3KrdYAjVTiiAmjn3WmhiY4K0fve7MtdrokNtUhUGu
         O8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784967248; x=1785572048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ttGVBBLV5S7SFqtsKUPChZqO8zfT3Rb+MVyL1uhuCco=;
        b=RNyT1Quj9FoFAb3VOuykj+TCKALMVlrowX4k2pFSd7WH10bA+CmkRwLZsviUjFnr+P
         tGwlh4mSLmHaBiH/WLwevkq4XBA4g3x5AiQeUnoYnYYaWU8i6LNLPd8frj6sFHweHre+
         hIUg2x6nI7EDgWuWNxUgLMhLv5nganJ5btUUak9M2JU1OmgnK7JPAA2CAjAAZZkTp5Ok
         ZOW4ckOYstNy61/uD3L/xfTjHzPbFqNLguccIeEiIVUNyRCG8ztEc7hT6PPztKkFDgaQ
         ZQNyHIhwUn24z7pMtjche0ovfNz4JWeC+iPH1/q01cKNnkYeUaFEAVdFUMF6OMOV5m9Z
         FjEQ==
X-Forwarded-Encrypted: i=1; AHgh+RotZBud/z9IiFdNP+WF3zu3lC7sv84KKov06BXB96CmZrqUu8sq9TJ1Jui7wzJgnXTC8KNh+D1d3uMF@vger.kernel.org
X-Gm-Message-State: AOJu0YxxTFfM4GIWAJpDIWUtPi5wGqAQ0bMKDQl55agNDlhuEdyXWyWG
	qirddl6WaeKjLYF3FTma4/4jYsotXC4mLfEr5smxPRlu/UvzzVjouXWvCxcSfOHY
X-Gm-Gg: AR+sD11jxbfOdOB7llKzc/PI0VdBoIpNtlarsrf2l2orCLrVy4Bsz/TS6l+dQBh1Sag
	Kq3+WYB3NCHi0SA5gJwD1KPAj9o9l7Wh088Mafzcfbxq74+24aDuj9io6n0smz5Y6pelEu6yXcT
	E3Q+g8PKKIFXLP+B/swegXxiSP6n4OdEHcNjiFQ6AzTmUTDdqL6voXdjx7tnvoej+vBiHVXqXje
	d/NKVeuGH5zj62Xw1ZYnzATmTxO/PqtM3sv2iOH1kZCwQvJ0LH1CNjbDoZf4to/8ErOMIQMSEMP
	Ar5zBbzDAkNAUJ8VdoQcW37XMeO/MkBt8iNXSD9hi+ASJqg8nDXshZr2me7q/fjuhuoqju+PsIr
	6VaH2HrSOV55Q0R/SBTGEcghtLAQcVGYxllOlmx2t2cEYA9duW6ZqjOs+SzKdxwxEFOVsATXlZj
	z46Nv7RSMgDz0oIjOZf43F
X-Received: by 2002:a17:90b:390a:b0:38e:6f72:9be4 with SMTP id 98e67ed59e1d1-38f293cd425mr1669488a91.3.1784967248185;
        Sat, 25 Jul 2026 01:14:08 -0700 (PDT)
Received: from localhost.localdomain ([2409:408d:79f:1f48:d3f7:8b5a:7633:b67])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm56487293c88.2.2026.07.25.01.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 01:14:07 -0700 (PDT)
From: Arunachalam <arun07172003@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Andreas Werner <andreas.werner@men.de>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arunachalam <arun07172003@gmail.com>
Subject: [PATCH v3 3/4] leds: menf21bmc: Convert to dev_err_probe()
Date: Sat, 25 Jul 2026 13:43:48 +0530
Message-Id: <20260725081349.8556-3-arun07172003@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260725081349.8556-1-arun07172003@gmail.com>
References: <20260725081349.8556-1-arun07172003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace open-coded dev_err() + return pattern with dev_err_probe(),
which also handles -EPROBE_DEFER correctly.

Signed-off-by: Arunachalam <arun07172003@gmail.com>
---
 drivers/leds/leds-menf21bmc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-menf21bmc.c b/drivers/leds/leds-menf21bmc.c
index 6b1b47160..a7e4db487 100644
--- a/drivers/leds/leds-menf21bmc.c
+++ b/drivers/leds/leds-menf21bmc.c
@@ -84,10 +84,8 @@ static int menf21bmc_led_probe(struct platform_device *pdev)
 		leds[i].cdev.brightness_set = menf21bmc_led_set;
 		leds[i].i2c_client = i2c_client;
 		ret = devm_led_classdev_register(&pdev->dev, &leds[i].cdev);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "failed to register LED device\n");
-			return ret;
-		}
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret, "failed to register LED device\n");
 	}
 	dev_info(&pdev->dev, "MEN 140F21P00 BMC LED device enabled\n");
 
-- 
2.39.5

