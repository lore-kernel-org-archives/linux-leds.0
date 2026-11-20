Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795133259;
	b=nx77N3OdmgU6VM2GXpx4gUCC2P5CTJ3lx5SSnHqrzM3ks7PSE22pDupc4ilw6J5jfGdt
	 qdSRDH2m1JAbjbvRzqFlDX9lHnK6JrvJq/wqcGDM3RN4JSdxws3wS9RaWUdn1ELNlLxQP
	 aUwRtnBmxU3eHc2jxO1K0DE23HRcvM2UqXfNbeP0JNTe5wtkgtJMQo69vWc/YDKz3Ej+J
	 xZG6djxhwHTJigszFtmzy0MfXOutSoD3njBKa9Fx+rWZNFq70ndc7u87yaHzvKH/g4KWR
	 +QA85dzhSWKCU92bgwQxL9f1zihCLCj2DXWjD+0B4NrtudCUoT/m6Vj74gnyHkOjGMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133259;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=t16WbR9EuyIgGzZ3JCCn7Z8O5VU3QQzc3GYSV66MtMg=;
	b=PHcKqgt0RvLNhhnbQkekvBMMPxy/MI7Ew+eILGOb//MJRdR9x0FlBzN11fCttkBbfg5o
	 9FwddzdfrCvUWKrszkxyVG1KI0+YZeHWbAUWL/llML4buqqgKgbecGPbsnr0nblvBdlpO
	 25mOnIvMJJBvNOWwO8YiLyWw5U1HElDFG9Kcus5ptbD9+RsWER5eLLvEyNzsIN64JVvQa
	 F4d4Ybx/08LPfO0fJUtMdj6xRRLf2wf6P7C06Fk/LrhpaqYqWIU41/3hYUgwPvB7Zc4vh
	 AwKpKChZOr35YNUfNpb09/DCn3b3nq6wgwA9wt722sd4tm7El6AQ3FVovC1MJhzTAtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZVAidGIK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DE960A3828;
	Fri, 20 Nov 2026 00:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZVAidGIK
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795133258;
	b=XAwAESCNtltCyGo3sJiko55EmeibI6q4vJhCf/bIUVrPwx6cM6XqqocARqCKsTQGf4tk
	 JxF1pqQnIxqqgQHxyN6RaLqqz+NisqEnLWB3GRhGfWvdBsZnEoNRfLLAWseM1TKzKcq7b
	 Xzb7s4tp+czeF0R+oGyw3UmfTe18XWCocHtBHuFBafCfRvA1Nkc+3nb3bEaWuAX3RMSqj
	 UwRrQDDjE+qjg1GvtnwzJiaZJ73NQZSRzMGenM0yal9uMWmom8ud1ZZ6lDxCUgHPnc3mX
	 LGmYzHZH3UyVanxo6T5nADqIwdPmcKncssQZxg4k3yx3gdT8LZmT6x3qENT+YpBSTUg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795133258;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=t16WbR9EuyIgGzZ3JCCn7Z8O5VU3QQzc3GYSV66MtMg=;
	b=mWvLKPIGgDvCrFPPncbinsxfK7pERcvOfg4Vi5BbRkob3BrFTh2Pk05VREckcWmQHI6E
	 B1s+/WMEGj6zMJyJueHr4b584W+rZQ98XTu6sj7K1Oh74dUYtZOtR4f30rThTEv2Ro1rZ
	 DA+6GOzaSrO0FsC3Un7uHZlt/73lzKyVV+9Eml1ZU8AIxANa4REEdiiiUupXrdF4b6VtA
	 ZOKeTI+VgnOnoOQ21TTKdkJ2QZAq3jfk3pPRQnT6WZaW53018Bhe+s1FE6BguDNQjx41T
	 9tqL+0p/WpFI+jzYtL/f1L0qtk95WRgD81j1xLeneKuIMMqi1D8siP3mR0x28I5LkEQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1B9C41F000D4;
	Fri, 20 Nov 2026 00:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795133258;
	bh=t16WbR9EuyIgGzZ3JCCn7Z8O5VU3QQzc3GYSV66MtMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZVAidGIKzOWOrwqluafNNOvxXPt80Rsds4HZdPFYTBAU5HyeKE8pZl3a9mWuH48nC
	 7JYuB+2rb3bEFRHh/1q5p8yRqoquA1C5Dhqf9bLqVeIfHuzICVcHGtzMqSo3iS6Co+
	 IMzlfec1BvFaSYssTq7rHN/Do2lDobr/wslfn/9DxAlZRMD/26cIa0/Rk0jPiImzMb
	 GtB1oInyYABC8JjACQv2bbxqATcr2e2JuzRi+oKKwfkycW6C3or+7Qy0I+TbcCe0//
	 seC0agSQTzWU6qAXdUsuwOJ+I/EnUDE96A474oJro7FTu0/22rbK6RN08xgmYXT+JI
	 PC78r0xL+elDg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F3ADA424F3;
	Fri, 20 Nov 2026 00:07:35 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Thu, 19 Nov 2026 19:07:28 -0500
Subject: [PATCH v3 06/11] dt-bindings: leds: kinetic,ktd202x: Add Etek
 ET6326
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
Message-Id: <20261119-ktd202x-et6326-v3-6-98b836b1cddc@telaak.dev>
References: <20261119-ktd202x-et6326-v3-0-98b836b1cddc@telaak.dev>
In-Reply-To: <20261119-ktd202x-et6326-v3-0-98b836b1cddc@telaak.dev>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795133254; l=1708;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=a87pmZOYciXu8wPOBt9hfD/vnlp8BaUGzhCLXazMciY=;
 b=HP4JIq6MUbGx3fHK3VijWHbKvet9/Oah7AjmTiwjM/6JTsz/6AvlyMf9GPB5iSVaFeeKbAA/0
 gKhSEZOLzwwBR9oNXl0uNZqYl+snfGRdpz4kpFJ79APxGRVTiFwJacP
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

The Etek ET6326 is a 3 channel LED driver with the register map, the I2C
address and the current steps of the KTD2026. It only differs in the
flash period, which is (n + 1) * 128 ms instead of 256 ms + n * 128 ms
for a period setting of n, so a KTD2026 driver runs it with blink
periods that are 128 ms off. Document it with the KTD2026 as fallback.

The ET6326 drives the status LED of the GL.iNet GL-SFT1200 (Opal).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 .../devicetree/bindings/leds/kinetic,ktd202x.yaml         | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/kinetic,ktd202x.yaml b/Documentation/devicetree/bindings/leds/kinetic,ktd202x.yaml
index 832c030a5acf..b13c71721853 100644
--- a/Documentation/devicetree/bindings/leds/kinetic,ktd202x.yaml
+++ b/Documentation/devicetree/bindings/leds/kinetic,ktd202x.yaml
@@ -15,11 +15,20 @@ description: |
   The data sheet can be found at:
     https://www.kinet-ic.com/uploads/KTD2026-7-04h.pdf
 
+  The Etek ET6326 is a 3 channel variant that is register compatible with
+  the KTD2026, but encodes the flash period differently. Its data sheet can
+  be found at:
+    https://www.etekmicro.com/wp-content/uploads/datasheets/ET6326_datasheet.pdf
+
 properties:
   compatible:
-    enum:
-      - kinetic,ktd2026
-      - kinetic,ktd2027
+    oneOf:
+      - enum:
+          - kinetic,ktd2026
+          - kinetic,ktd2027
+      - items:
+          - const: etekmicro,et6326
+          - const: kinetic,ktd2026
 
   reg:
     maxItems: 1

-- 
Git-155)


