Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611805;
	b=OQYaQeoZwfj034wINesazaMKNcuf2m4lREu9Bhs8XyKrbMlJ6dxA30lKSJCfrr2y/1Vr
	 EH7yLj+ibV/zgs9lCgcjiRiiMfOq3Tb0DU/pfnz7hQ9aYHaYhuirGl1gRP6zRj/sjPqIc
	 ddX/cLcPwW7fnG21tTWWlhF7wGHZPYdPwa7B68Y5fYKIhPHaETXhbcwx0Dst3t3Uy6epR
	 TeOMN+1GXru18iJE5J470vla6q7ds4UIhPzgIvKrbe7QBsQrao5QTarM5O5ajtwORT2Ps
	 QLb/V1cFuJiPqJzKl8vgsO4X38QGj/YX3wGSFwqKismiUD6NXzLQ1Vsko5iAsXbCKIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a5xGOy1Y8qX5kygqf4NcjH1ozs8nOHqjaESuDvk+ENA=;
	b=C25I799kobE+5QF8nQJQKMV4liOSrlajcOWCqqeOoe91n7r+b7ejCh9qTuf5hNRBjK80
	 uclPJW5cWdPnMhVy2dJXCFUxukNKPCIhcJiq/vYOizEMRUoBxyuVr6HgJ9dS3UnP0KZq7
	 sT+ukOIIEUYCv+9EF+iSgjjj6hjKfxoLeFZ2KXdH1xqZBLzGsrwuAqmjvtrKeyLzXJzJk
	 9s4GPC6OU1onywNKeXLZ7qxjHoqRJ/6r9Bk1nFRL0SZmZLN5zQeFPJ3ir9tu+am9VWoZN
	 c/NWLdG72oUlefa/Q+Ff7tKVP0zMLiV+R0rMX6H0ng2CL2kyzp4TAz4Rjb8jZa8ggYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvtQCGis;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D12E606A321
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 13:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D12E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvtQCGis
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386c71feeeaso2013948eec.0
        for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 05:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795611804; x=1796216604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a5xGOy1Y8qX5kygqf4NcjH1ozs8nOHqjaESuDvk+ENA=;
        b=qvtQCGis5R2+3zRGaI/MoSWQdmBSSqhgAhnv6ZHn4/NyKAVl9IymDMb8Wh2Kndo73Z
         ZZa0Li3HvnFKuKn749ON+gif50p8HGCpCkx1Bk5dV0adyVFJDVDOO7D/s+a5B+LQxZfw
         9qOTns9cWVsMGQNAAFMMNWfimCzhDXJBt/SyV2s0yr07SjEBflgE4mK2bzpDJ6Va87/u
         vm0jCyUKZAbn6py2afwzOhocKfGIJ15iCE3j2yBr1Ta2cW1aB7P0J5/yZRnoAdLVpY+t
         sYXwHZaeK+bYRHcY55tnuSlc6DViLTmbDiwt9kyU0+hTFM+dXNrW8IvdfCX/BTBSVPIi
         uNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611804; x=1796216604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5xGOy1Y8qX5kygqf4NcjH1ozs8nOHqjaESuDvk+ENA=;
        b=zE7aMryTGHELRLApFeACSkSzxQfkDkbEdDcgRzV1NKKhwAWRV0f63NTdSiIxCgXmP+
         qy4Se487CaQMwTcWVEWiIqSyc7oQJhn2fF1YKSXn/GoHng8sl7qgf6bMgTcxWExvM1sM
         s6psBbdmUZ5cxTtJ3sz3aGNHLe4aoj2GKWvYcnX7uaQY2CP0mECK969WKRlocAikj7y0
         LvSJrMVBGzltEv7To1xfxuUpRLX7TzBKsd6aQcYPhZi9/kxEzHAqnQYa6s1D3he+W4b/
         hqXPW4Juy30WahegyG6g9lgfMJCS78FKYKbBkjX7aFUDnPDmKjySVongj9mcTDgPI2Iz
         EdKA==
X-Forwarded-Encrypted: i=1; AL+hErGRgpblV6ENLhqdmIUDiKV+5akEVep1T6zTXzO4SOCNm+jTTqDDOvbBIAIxjqOh+G0xplqAmP0cJmm0@vger.kernel.org
X-Gm-Message-State: APuU4Z8rOd/tdrStHXNuDRq6kGhXCM1ceMngzH8TlChYmVF70lAs75eL
	8KkqUH+3JkyrtDILU3a8ndGLySni0o4PlPmH4aqcb/4YT9R8OBprkvhUA4tuSw==
X-Gm-Gg: AZFdTZePAZZPAYzDhZb+bQnrEs1+oF41m/stjqs2OLrBkt8cTGKaxqRSAWS2lAABUUb
	ZY7TqQy79jD8C/O6g9VUOc8l3RowOvp01Z9Q+B1M2L5t9SauM7HjaYAfdgIvQU5AxrqBzexPcFb
	8q1gK2yTlkMRlfsEhzshtWXX3ewgXsYzmGpXQT6nLFXoYLP/oWNh0Jr5hR6jlEJ/O6tMJ/8BI3F
	OljWaPFOMkpdI2qYXM1mh0P5oRVZrfgCg8G4oOPPVAEX6sVFd2j2DubCYSxMrEbc1nPMhWMn77o
	6ME64agHTIGxFNJpoVm1Tld0wFrNY+r+j+x4B9phmuk+ziJ/gTFFZFtrjzQT3HKOfPu71yCS9jy
	tgFdl7NBIpZPk5ALV7UKqrSU/KhqF1Wf2QjKnsA3SrAzNS7CFGpqtUiFFYcDJuz8Ryg8AU5uGYw
	AErOa9F8GeLq93mnpYPJ4HAGuKQtX/LcA/hV72ClZmx4EttJUaL5UpTUzzGziSNDR6J+j0X9ZA6
	57RagqJkDH1eFgCU+1sOxLZhRH9MVVp+mk9HpBZyqTSC0qsB0VqUb1G8ELfgzkfKi2SLdgltyK+
	IQt8d8jdKDP0/CoaacuQS3ed4dpNypMDm1APxYdkXukvs9shQVwBkhGf8L81Ohfjn7dw
X-Received: by 2002:a05:7301:152f:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3856c6b35b5mr20268857eec.2.1795611804054;
        Wed, 25 Nov 2026 05:03:24 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm55976030eec.6.2026.11.25.05.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:03:23 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: ChiYuan Huang <cy_huang@richtek.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: rt4505: Put the child node reference
Date: Wed, 25 Nov 2026 20:03:18 +0700
Message-Id: <20261125130318.2590336-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
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

rt4505_probe() gets the LED child node with device_get_next_child_node(),
which returns it with its reference count raised. The driver never calls
fwnode_handle_put() on it, so the reference is leaked on every probe error
after that point and on a successful probe once the device is removed.
The v4l2 flash sub-device takes its own reference on the node, and the LED
class device only stores the pointer.

Drop the reference with a device managed action registered right after the
node is taken, so it is released after the LED class device that was
registered later has been unregistered. leds-rt8515 puts the node of the
same kind after registering its LED and flash sub-device.

Fixes: d9dfac5419d0 ("leds: rt4505: Add support for Richtek RT4505 flash LED controller")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/leds/flash/leds-rt4505.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/leds/flash/leds-rt4505.c b/drivers/leds/flash/leds-rt4505.c
index 6a47760645f1..d397b1237c93 100644
--- a/drivers/leds/flash/leds-rt4505.c
+++ b/drivers/leds/flash/leds-rt4505.c
@@ -338,6 +338,11 @@ static void rt4505_init_flash_properties(struct rt4505_priv *priv,
 	flash->ops = &rt4505_flash_ops;
 }
 
+static void rt4505_child_put(void *data)
+{
+	fwnode_handle_put(data);
+}
+
 static int rt4505_probe(struct i2c_client *client)
 {
 	struct rt4505_priv *priv;
@@ -370,6 +375,11 @@ static int rt4505_probe(struct i2c_client *client)
 		dev_err(priv->dev, "Failed to get child node\n");
 		return -EINVAL;
 	}
+
+	ret = devm_add_action_or_reset(priv->dev, rt4505_child_put, child);
+	if (ret)
+		return ret;
+
 	init_data.fwnode = child;
 
 	rt4505_init_flash_properties(priv, child);
-- 
2.25.1

