Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB493D9DC3
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 09:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883875; cv=none; b=tzx3OUR+pcYMqHFFNLPU5ALRghDCASaUzsH+2IeWstvXZxjKkmoNNmY7G07lCd3Og6ZsZmfmUWtC5+ke+yOAB4mDDtmukZuDFVTQib8l9WodvFqYMS2I0ahr4ck4oHtjuJm/buUBuZ02RFpGHHdDQ0Dks6VEceogwmpRjh/RauM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883875; c=relaxed/simple;
	bh=XVFaXEYG2jOij3HyMr7u9yLLDZy3V4Xivvx6eVWoUcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hNUUaEYKiZXMjr/wWTwaLI9U/A2I5fq9QcYMz0n7gvAdBPCh+u6BeWYIniJwzQRmQvSb1zXvTGky9qJAPSg2M7qM5Eu9JOZmOpIRYO4ZrFuD9cBu0qFs5Uzd/7ZouvM+FTvu2ElxY77/z/4gUyF1/ozkgBvY5MCSkGh9VImB8iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjQ4WzFM; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjQ4WzFM"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2acc1e170cso438496266b.1
        for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 02:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791883872; x=1792488672; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+NB6q1K55xrXTqewDbSwetE1j/mAPNyb/yxnJTgeOys=;
        b=hjQ4WzFMmAF+BTTFBWaPHmNTmT7t4JVL9XfcTBk1GPItkoyMHhNLM9Xt/rJov0k8ZR
         Ii+6lhUwIIN6FILMdsxGClz0OOMBbouOfNaSnw+1JFT5AO6B0XD8KQ1XQyVGXbJSCGrm
         npqiXa5LfkTOkL4JLo3rY9UkfoyS5Krt4jbmk38dZ9r0NjlbIxEtzgj2asowAra+CFA2
         IA+I4henvLe7xk3mViB8IhIqJOTVkxGzDRzIPEYz/SgSHjqvl1IO3EJ0dP2M30vLJQam
         eGBpgGN4yP57HLRtdaNj4RRg8aPicBTbz4qXZoySHsAud0ODuJt6ytAStknUL2aMLOLY
         PV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883872; x=1792488672;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+NB6q1K55xrXTqewDbSwetE1j/mAPNyb/yxnJTgeOys=;
        b=wVVfXKtSebwH9yQH47kXe4tb0Rlum+hoKciHEydqjHPI+YgpibahhpJWKYsY1WqLaK
         T7euT/XmkjIEY+QqwPPxOTWnBTapimNk2BuiIhFNpVob+pVvseS2rWLkc4I3DLejVD3l
         HBzrnQx/+s9YoDSUrx+2tPTTNnln3Sr79aEYbGMKdUbi9ADvENAbUxIkz6jiiLcbuG6J
         CVA3P3FIhGwdJBaFDhi+CKHsEYWub6UGv0G6wAGFTVW9hFBjHbs+EQ84v325XmJiTx5V
         nLiMGCrLXtMUJn+a7SHZ0SEwgGwjED7NMISf2fbkpbIkVr1NqBBeC8J7vsTmfpR7uV/R
         FCZw==
X-Forwarded-Encrypted: i=1; AKwUvBxNE4LYzV5WbG+gxiQ9bA6RO5nH14IBX34kWTJqkXcFgh1t7PIRIFNAalmWvJs9mIFRf6gboEsHu6RY@vger.kernel.org
X-Gm-Message-State: AFq9FYKigdVhzvLeA1b3mEImZ/vVgPPbHlOtyXo4T+P/2mv+GLlZKqXi
	TBeSTMQ4f8Ob0MacM3yKoYL1y8Wdf4bzPtSIn44rsD1Ns1oy22ei+2qE
X-Gm-Gg: AYBFou2fXQnnfrpK7qC/IH6CexY/QHdOH4CJnnbQbvpc8xTPFjBi1W6uNJfyE2HsQdv
	2XjOiyzVaSVIRcb9WlM74UkauNn/Z96KSdUSUkAV6ORhPGCNDx5eVWssY8kAz7J4GCQpYjPQn4F
	PFQSWEcb/L1ZwTvRGXKUPmkj/vElKdw4zShyEpTmCE3M6V8tfIY+908iZWugo4JSQf1xAVw74kU
	AsLsQaQYoaMZbsWwAf4GmMP2cQJv8m0NsOeMdNiIpZmSNLxLOnbrdQew94cgXxMQGARH6eKFHP8
	R499NjGni779jahDG+Mm4Vz9vHLdcVmssEdFi3Qp8fQZhvYwOFUEqjAPKboQCREV2YbQoYSah5J
	29JjIHtFB1AZy0Y4IH8cTA8azoTtdl70Z/CCXbFcSGhTq5LJMiBnLsdFyG/zQkdF4fzDhckoJKv
	pULH7K8V/iyR8zOU8gpwVSnZu5z4eEDDQ9BkfwBv2ovCxqdUZX4NmjvE7KckYbSo98Ipa1dNib4
	Nr4x0CzpqtGp8Za4WqHqzjdVkNg1P2jyDklk+HRaBKvAtRSZc2Mu56u+J5R
X-Received: by 2002:a17:906:f5aa:b0:c2e:3abd:aadd with SMTP id a640c23a62f3a-c31aa093e85mr1058348666b.37.1791883872324;
        Tue, 13 Oct 2026 02:31:12 -0700 (PDT)
Received: from rillian-arch.localnet ([2a00:23a8:8f4:6a01:5ffc:da36:c891:cd3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c366ed191basm105213166b.15.2026.10.13.02.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:31:11 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, lee@kernel.org
Subject:
 Re: [PATCH v3 2/4] leds: flash: Add support for the TI LM3643 dual LED flash
 driver
Date: Tue, 13 Oct 2026 10:31:11 +0100
Message-ID: <LwK5_fJASKu0tC1wo7o7Uw@gmail.com>
In-Reply-To: <sashiko-outbox-167401@kernel.org>
References:
 <20261011191026.149338-1-rillian.grant@gmail.com>
 <20261011191026.149338-3-rillian.grant@gmail.com>
 <sashiko-outbox-167401@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

> [Severity: Low]
> This isn't a bug, but does this commit subject violate the subsystem naming
> conventions?
> 
> According to the LED subsystem guidelines, embedding subsystem subdirectory
> names like flash into the prefix hinders Git history categorization.
> Embedding implementation details can also create rigid and non-reusable
> drivers.
> 
> Could the driver name lm3643 be used in the prefix instead, such as
> "leds: lm3643: "?

Happy to switch to "leds: flash: lm3643:" across the series if there is
another revision, or for the maintainer to adjust when applying.

> [Severity: Medium]
> Does this sequence require a hardware startup delay after asserting the
> enable GPIO?
> 
> The lm3643_probe() function drives the HWEN GPIO high and then shortly after
> initiates an I2C regmap_read() to fetch the device ID. Failing to provide a
> programmatic delay (e.g., via usleep_range) might cause the I2C transfer to
> fail on platforms where the CPU executes the bus transaction before the
> hardware state machine and internal oscillator are fully initialized.
> 
> Could a small delay be added here to ensure the chip is ready for I2C
> traffic before the register read is attempted?

The LM3643 datasheet specifies no delay between HWEN high and I2C ready,
so I'd rather not add an arbitrary sleep.

-- 
Rillian Grant


