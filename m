Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793501738;
	b=Idslq7HTkjvSU8zhB9baL/bmrvDrTkQcpk+3Q6TUB3gwK7u5/B/V1Cmadb4UC4ybgv/B
	 MPbFxNn3Vh0rnb29yJfJ1myGzV/XjkX5FDMbFcRNlYAZLYJHaEOcYzCW7sHnOjO8bOHOn
	 5vmAI93NvPVZHkxfiy7mEXARmxKBQpMbR3gjzUk3j8qOM06Guj/kbrXnKx71m9Jm7Sf1j
	 jbxw7npgnnKSI5uOg1cZ+/SnjcLLhkIsjVo35kU8u7szPEOlL0gtsTIWec+Pj3p+6cdg1
	 Odkcn/2ZujFtYl78ZTe3DhRY8kzNa6CgfdAPFCdn/Sm2sBnRA2vs+wmcVFie+Lg4Y4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793501738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/B4nDnnhRON1wN9ONgeFtBXtuVmHjFwn3znjcRLF8sE=;
	b=SIoYvPvrAXyd23GoVP+ft0c69iiCSuSpiLAqBZP7Q9DYdytKMs6NzD7R8+SzYXK+xX3M
	 mxdOBsKKWNQRHa2k0d/0CNtYPPz0A8VRvFX/n2wFo/Svjbc0OFn9lIJrFiEUe653IgLhp
	 9RVTZXZwCa7IyOLeotREhjiKvBxWKeB+XVYlzxv4VvGww8Ll9TZPSNTO4QLOK03HPhibG
	 cTitvs1/4qWuvfpQuNnA5QyqTT2LXx9G78+sQzRqyu22rFR9vKHz739UWGlmOoK1W4zIL
	 a7FOwCQiDVsUlhMuQFI8W1DoQGS6rn9FhpCjc+6XQY9r6xoYHJhPA6MC1B+53cAHBIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZzvpIZUv;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76491606A324
	for <linux-leds@vger.kernel.org>; Sun,  1 Nov 2026 02:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76491606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZzvpIZUv
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e83d2cc8a2so4821285ad.0
        for <linux-leds@vger.kernel.org>; Sat, 31 Oct 2026 19:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793501738; x=1794106538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/B4nDnnhRON1wN9ONgeFtBXtuVmHjFwn3znjcRLF8sE=;
        b=ZzvpIZUvwHu4JOmw7lb39SxT9GgdwZfDbrfONKJ8DlR78/U5CVYRFfkfXHtgvNC4Cp
         zib28i51AXn8N5kVd4sRpEUDBBj0Fojhz6dtnjPfZV7dLZwPhTmOw5BWEgYQkL07DxT/
         8YAUnLCz4W1RU1jhDyUl/dBjX/7vp5f7rkAmJ+TV2uIU+gRDLaDwwJi75UxYHCdRScLH
         /HZqEOOdP/bM/BiLoXL6DVwE5ds0C7FZoSWBQl09xiBjYn/vkZoTLav8GSfMkBXqQinp
         qXNTOg0b5L13ZYzEfZzdw5rV1wcmjFlQ/uf5v4DF3rcjam8DlqneCtFxTQPNdI4CNOd0
         pv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793501738; x=1794106538;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/B4nDnnhRON1wN9ONgeFtBXtuVmHjFwn3znjcRLF8sE=;
        b=oX66hkambTWUG6ad74cG0c7J9dNit1PHuTw1/aTjs6aYiSCN1fyFTOf1QNoPh4iEQs
         EWFdBv8Kwj6GHuDGr5o/92rX9Nmhu6RLmnmYXnfqQX7HOuAJHq52gWfYm07As92lMYgQ
         bB4NjrMNocn8EeY0AzkXLeGwEF8cwVHCYA+qvHuHP7Qot2CmxaJJmP713Rf5qiL3RCaW
         TSrAjn2ypthuz2n8IZNNK3reIBifD8QqBrvMR0d9zfKy6ARmATQi+3+uRHswU1sxyIp/
         U5wgMbyohgpj17k//dR/lH1Gmt9BISROvb3nfvLWawPpKjkA7sZxKxO6RSxXpXVzmJEJ
         TjhQ==
X-Gm-Message-State: AFq9FYJPexgJogD5FDcRFKTwllY2XiRqWRaX7j2Dbed5oi/aj5D1Yjmi
	pnduYXaSwDo0fYeTFwW/cLCxauakhGr3QAz2XirB3lhjEINb1gKZOwe6TTZJuktzxH1srw==
X-Gm-Gg: AYBFou3fOIzPpLeGH2bq+OHS+UGMSYRuAop7nwxJqa44CD+zT7RsvEo99UQ2Wg0fpMZ
	HL2UM9YnmEDMdsqJGHhb9EixviZcZFFIwJM2O6yU3EMaXOlEVXyGQ//cYC0G1WhMgXy3VO8XAgf
	/m3/hYejYX13LgeCbCSf5ZK+6vmNUr/uT03bwsCYeI3kugeESO7NT6cSUjCbvxPBVfuweBwxvVS
	st3ukLUsZxcaKjTbddSiEAzwhRrwdD2NW5y39P+UV0I+bCl4Nzj9O/FOCYDfLVY6Hx5e9+SfTtE
	M/RnxoYXnUc35+pI1JZ9Ib4l4UFjmP/8aTWl4QZORoajT2ezk/laRseqwFxTk580hrahDSxF4Ni
	siW9VH+P0V0SdpRonWSZC47vDVNhwgRI9UUbZB2yZk0vEA5MNgl9It4cnuWxrevs8M6oNasgzP8
	exaHJSPM7hPKn+gEtJ3QUxtYsOOkyH9dxPc98Erqy6JnKeHgReP6l1QNviKf9gjuucoQqRQd+0Q
	xXPa8fFuJ1WFUd5ms+6dQxmPARDufRKIXliFVy7VImH+DoPAbcd5Q0P7bhNsuwe/a+BJanY/VSH
	gasdAjU52McSurFCOTNFqADsRg6SvBQjBJ7UZUUKV8QmiUjcKib0/UXhJA22qeVAJZc9aTFSH8Z
	U796VAMLQ0r2bEm1agWAqHqtGgQGUXO+gKPitkvO4Y9o9k2tUd0/wIkE2WH9FCpxS/TW95pN3be
	M=
X-Received: by 2002:a05:6a21:3982:b0:3e2:8c23:4d60 with SMTP id adf61e73a8af0-3e9283f8e54mr9489442637.0.1793501737764;
        Sat, 31 Oct 2026 19:55:37 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([180.213.195.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9c09086sm904026b3a.23.2026.10.31.19.55.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 31 Oct 2026 19:55:36 -0700 (PDT)
From: Ch1rpy <ch1rpys0116@gmail.com>
To: linux-leds@vger.kernel.org, lee@kernel.org, pavel@kernel.org
Subject: [PATCH 0/2] leds: flash: qcom: correct the cleanup indexing
Date: Sun, 01 Nov 2026 10:55:32 +0800
Message-ID: <179350173263.4235.13178040556572548913@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The cleanup of the qcom flash controller walks the LEDs that are
registered with it and frees the slots it finds.  It counted the
entries first and decremented the count before it used the index, so
the last entry was left registered and the next registration of an LED
reused that slot.

The cleanup also stopped at the first NULL slot.  A torch-only LED, and
a configuration without the V4L2 wrapper, leave NULL entries behind,
and v4l2_flash_release() already accepts them.  The cleanup now
releases every slot that is registered and ignores the empty ones.

The fix was found on the Xiaomi Pad 8 Pro, whose camera flash uses this
controller.  The commit was prepared by slwyts for the support of the
Focus Pen Pro; the original commit and its address are in the message
of the patch itself.

---
2.43.0
