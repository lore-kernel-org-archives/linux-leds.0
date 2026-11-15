Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732239;
	b=ltfJmKw84gd74RDcfnFW5oTkgr4EyDBQnw3siQQEpcZ7b/YILYWhlqTx5SRLLybrZshm
	 7OZo/jchU4AxhezYisMgEnL8BQYZV+aktTaZS1fExpmkfSt1L7ouhHS7T1F01kMARfL41
	 5fQxKkJmiBWMv+Vh27pvlRgYiiCL/z4kxEoC2cvOdoNgvQK5rwwjbN8i96Y0E01eSKqyu
	 A6wUtNfaO+2881vgL5m+MhxTp+dMR2l29MZwLfxVYevNhWxIl5e6V3GdH/tkj94UwRJ7t
	 z7VMTK6Wka3z924h8awbNabysRQVmB4N7bSwIXRbWMAKH1QKkgJ4v4EfyNP1Z3fN4tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=LaVpmV0idlXMMI+f1VveIpghVZ4EjsJ9ZRyJU/LLjxI=;
	b=vCSl+GgTEb/HQ9kHLCiG1Q0Ed8dM/BVYoiaIsiag6bP0Id0P1idDIXeql60sNo6qHq0w
	 t7m1S7adK/yYPfycTwvi6pyDlJPTJcoUK1Not0KHqedGgKirw5v95kuzILXWpxe09tTM4
	 C47OPtja4psKorVoqaxR6XB8YBieMNMyXdp3okpmdz2LN23tC+Qi/2AzZmqXyAJutxxQV
	 dd+w9MVRbBQTj9WuW3WbWsoNZuJNscA73nlN6VjPUr6TmHzuMLGFKE1gWLZP1eBNwVhYz
	 ItJ4S19tH+HLJOpnoXOeGlfaTR4GLPdPMTaoZwZ1u817xP4b5bsvU0XmHfD8Vc8hh+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EIn+1UM6;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5D6606A31E
	for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 08:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA5D6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EIn+1UM6
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d473cfff6so342183066b.0
        for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 00:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794732237; x=1795337037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LaVpmV0idlXMMI+f1VveIpghVZ4EjsJ9ZRyJU/LLjxI=;
        b=EIn+1UM6I9MphSz8e1d3b8lsbhAYFhuD6LODmakKs2seBRzp05T+dxJpqAm1mFbIF+
         T9kGVloMghiS/rRUx1NFi0Z3yOaqiv6JNnz3EhThAfl39twaDaSydmwh2BbdGqojSQcw
         YnBRUF7Iwl4IsFe2UpXO7wd0TDadQFhsoFaDnL3IAlR4l2j1IRfA7VYJVjGWUnwuOy2P
         /LQ3mwIg5KIcBkMLYh2nmKSO+v3z/QQpEpvJSBilPLUQkA6s+/euNCywbcyDo5U4PtDd
         D7jt8AY+3g7qmaNOzx8EjPrOOPAej2IiQcEsfof6yRJ+b2sSSZglZ7tHsRIDpHxAfT8W
         Vltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732237; x=1795337037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LaVpmV0idlXMMI+f1VveIpghVZ4EjsJ9ZRyJU/LLjxI=;
        b=NII0RPTa96jVYR3ktCtHQT2UNgSRp3YUaaYkHEbxJzz9L4mPPKffPB52H3N2V3Bjkq
         MAnhZ6GhTtXN3v9T1rst15xwwEZ7m+fyY659am+TZsWUBrLvh2vucNNYBbRWiueoRQBi
         ShNbRPhyKNrvNRq+9RU/PpHNEFt39RMqy2pUpLExTQ885g0IssSbANVGpo1FzhH1v2+p
         rZcHh1YeWmznj2+QFoIOzSQ1oIko8cpGBFuydi4Q+oX9aLSLgzi6nUCTd3SM+2T7nd0F
         cATomwTsnjNPbPscgq/cIGRt1PWJIbGux+HcA/oDeHpgF48OaD9iWsAz8CH2VGuikXW3
         +/rw==
X-Gm-Message-State: APuU4Z8uJCg1dSf5f7RrBH4qkeKTerMtg2riPp3Dfkz5eSNvSrjz2gCh
	I76R3UL7G/8voqrahRqbfJ1p0lhWqjTzTXKqUpsw37njJRkiUSrrxLw4
X-Gm-Gg: AYBFou1HIQSCR4RN/Fw0MTMbSzUb5EEPmaAHeXYuEju7rUtnKO3Cz2LHZ8r36rO/3lu
	OvcGme5bwdQhHu7LwGNEdiiLBOJq1qsK3q9McqXAcW+jQXHzF+7GwjwH5TNrOrO9hMUuhhrf28R
	3pvZus/QNjWyjpkekL+51aWWjQHJgKZif1IGYoWHyykze53nyUSQ0JNQlownmy8plnbLTN6Okx7
	kVdTzAxvypi/rEm9wY/9V6VVB4E8VD8j9iGFRHmkK0TTWNo+6c5YvPrkhfF30GJ7fatGZwZZCii
	AXqPrmdmX8uc2sndZUhpz0G8e+2Yq8HOWzRH9TVy/R1aXg4C+GW/q668L86z0o0k9P/GWEQAuQc
	yT7jd4fu5UdET2bi3fSotp6R28raQsYMgdjR5B9hSt+PvePj85291/TrgHrHvcgA6QZ5omwlQ5i
	bdaF60xoBdpmyhNsAsAAUzmLcuJNjIFowkzEsz4dgTTnFGcFc80nGkB1PlbksHLPq0lCA5kTc0t
	9fe1/I5CorJRemFv0svlHpvA0f2qdbrdRYjU/vJb7GVxqL405aR87A4U1nTddHQyUxwOqPr4X/h
	OD8+YRbS0uqj0Jj1sWr17qWP8/4/QWfYg2qBOdTkcNIn3pkve1Lf4xPJBtNMCPA5DEpZAl7PWKz
	etFWJYtBJaA==
X-Received: by 2002:a17:906:c14e:b0:c43:ae92:9ad with SMTP id a640c23a62f3a-c5096343974mr536243966b.17.1794732237050;
        Sun, 15 Nov 2026 00:43:57 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b979e9sm288937866b.85.2026.11.15.00.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:43:54 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] leds: lm3533: cleanups and support getting LED sources from DT
Date: Sun, 15 Nov 2026 10:43:45 +0200
Message-ID: <20261115084347.70592-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor probe and switch do managed helpers, add support for configuring
LED sources from DT.

This patchset was derived from
https://lore.kernel.org/lkml/20261112081941.41363-1-clamor95@gmail.com/

Svyatoslav Ryhel (2):
  leds: lm3533: Clean up probe and use managed helpers
  leds: lm3533: Support getting LED sources from DT

 drivers/leds/leds-lm3533.c | 105 +++++++++++++++++++++++++------------
 1 file changed, 71 insertions(+), 34 deletions(-)

-- 
2.53.0

